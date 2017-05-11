package com.bbs.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;

import com.bbs.entities.Book;


public class Search {
	public Map<Integer, Integer> doSearch(List<Book> list, String query) throws ParseException, IOException {
		Map<Integer, Integer> rankIDs=new HashMap<Integer, Integer>();
		Map<Integer, Book> books=new HashMap<Integer, Book>();
		StandardAnalyzer analyzer = new StandardAnalyzer();
		Directory index = new RAMDirectory();
		
		IndexWriterConfig config = new IndexWriterConfig(analyzer);
		
		IndexWriter w = null;
		try {
			w = new IndexWriter(index, config);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//add all the books into the document
		Iterator<Book> iterator=list.iterator();
		while(iterator.hasNext()){
			Book book=iterator.next();
			//add every book to the map
			books.put(book.getBookId(), book);
			addDoc(w, book.getBookTitle(), book.getIsbn(), book.getAuthor(), book.getBookId().toString());
		}
	    // the "title" arg specifies the default field to use
	    // when no field is explicitly specified in the query.
	    Query qTitle = new QueryParser("title", analyzer).parse(query);
	    Query qAuthor = new QueryParser("author", analyzer).parse(query);
	    Query qISBN = new QueryParser("isbn", analyzer).parse(query);
	    int hitsPerPage = 10;
	    IndexReader reader = DirectoryReader.open(index);
	    IndexSearcher searcher = new IndexSearcher(reader);
	    TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage);
	    //2.search with ISBN 
	    //if any book match the ISBN, then return that one with no need to match other fields
	    searcher.search(	qISBN, collector);
	    ScoreDoc[] hitsISBN = collector.topDocs().scoreDocs;
	    if(hitsISBN.length>0){
	    		int docId = hitsISBN[0].doc;
		     Document d = searcher.doc(docId);
		     int id=Integer.parseInt(d.get("id").toString());
		     rankIDs.put(id, 0);
		     System.out.println(books.get(id).getBookTitle()+"\t"+d.get("isbn")+"\t"+d.get("id"));
		     reader.close();
		     return rankIDs;
	    }
	    else{
		    // 3. search title
		    searcher.search(qTitle, collector);
		    ScoreDoc[] hitsTitle = collector.topDocs().scoreDocs;
		    // 4. display results
		    System.out.println("Found " + hitsTitle.length + " hits.");
		    for(int i=0;i<hitsTitle.length;++i) {
		      int docId = hitsTitle[i].doc;
		      Document d = searcher.doc(docId);
		      rankIDs.put(Integer.parseInt(d.get("id").toString()), i);
		      System.out.println((i + 1) + "\t" + d.get("title")+"\t"+d.get("id"));
		    }
		    //search with the author
		    searcher.search(qAuthor, collector);
		    ScoreDoc[] hitsAuthor = collector.topDocs().scoreDocs;
		    // 4. display results
		    System.out.println("Found " + hitsAuthor.length + " hits.");
		    for(int i=0;i<hitsAuthor.length;++i) {
		      int docId = hitsAuthor[i].doc;
		      Document d = searcher.doc(docId);
		      int originalRank=rankIDs.get(d.get("id"));
		      //replace the original rank with the mean of the ranks of title and author
		      rankIDs.put(Integer.parseInt(d.get("id").toString()), (originalRank+i)/2);
		      System.out.println((i + 1) + d.get("author")+"\t"+d.get("id"));
		    }
		    //add to the rankedBooks in order of the rank
		    	rankIDs=sortMapByValue(rankIDs);
		    // reader can only be closed when there
		    // is no need to access the documents any more.
		    reader.close();
		    return rankIDs;
	    }
	    		
	}
	private Map<Integer, Integer> sortMapByValue(Map<Integer, Integer> oriMap) {
	        if (oriMap == null || oriMap.isEmpty()) {
	            return null;
	        }
	        Map<Integer, Integer> sortedMap = new LinkedHashMap<Integer, Integer>();
	        List<Map.Entry<Integer, Integer>> entryList = new ArrayList<Map.Entry<Integer, Integer>>(
	                oriMap.entrySet());
	        Collections.sort(entryList, new MapValueComparator());

	        Iterator<Map.Entry<Integer, Integer>> iter = entryList.iterator();
	        Map.Entry<Integer, Integer> tmpEntry = null;
	        while (iter.hasNext()) {
	            tmpEntry = iter.next();
	            sortedMap.put(tmpEntry.getKey(), tmpEntry.getValue());
	        }
	        return sortedMap;
	    }
	private void addDoc(IndexWriter w, String title, String isbn,String author,String id) throws IOException {
		  Document doc = new Document();
		  doc.add((IndexableField) new TextField("title", title, TextField.Store.YES));
		  doc.add((IndexableField) new StringField("isbn", isbn, StringField.Store.YES));
		  doc.add((IndexableField) new TextField("author", author, TextField.Store.YES));
		  doc.add((IndexableField) new StringField("id", id, StringField.Store.YES));
		  w.addDocument(doc);
		}
}
