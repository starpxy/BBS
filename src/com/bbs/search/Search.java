package com.bbs.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

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
	public List<Book> doSearch(List<Book> list, String query) throws ParseException, IOException {
		Map<Integer, Integer> AuthorRankIDs=new HashMap<Integer, Integer>();
		Map<Integer, Integer> TitleRankIDs=new TreeMap<Integer, Integer>();
		Map<Integer, Book> books=new HashMap<Integer, Book>();
		List<Book> rankedBooks=new ArrayList<Book>();
		StandardAnalyzer analyzer = new StandardAnalyzer();
		Directory index = new RAMDirectory();
		int lastRank1=0,lastRank2=0;
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
		w.close();
	    // the "title" arg specifies the default field to use
	    // when no field is explicitly specified in the query.
	    Query qTitle = new QueryParser("title", analyzer).parse(query);
	    Query qAuthor = new QueryParser("author", analyzer).parse(query);
	    Query qISBN = new QueryParser("isbn", analyzer).parse(query);
	    int hitsPerPage = 30;
	    IndexReader reader = DirectoryReader.open(index);
	    IndexSearcher searcher = new IndexSearcher(reader);
	    TopScoreDocCollector collector1 = TopScoreDocCollector.create(hitsPerPage);
	    //2.search with ISBN 
	    //if any book match the ISBN, then return that one with no need to match other fields
	    searcher.search(	qISBN, collector1);
	    ScoreDoc[] hitsISBN = collector1.topDocs().scoreDocs;
	    if(hitsISBN.length>0){
	    		int docId = hitsISBN[0].doc;
		     Document d = searcher.doc(docId);
		     int id=Integer.parseInt(d.get("id").toString());
		     rankedBooks.add(books.get(id));
//		     System.out.println(books.get(id).getBookTitle()+"\t"+d.get("isbn")+"\t"+d.get("id"));
		     reader.close();
		     return rankedBooks;
	    }
	    else{
		    // 3. search title
		    searcher.search(qTitle, collector1);
		    ScoreDoc[] hitsTitle = collector1.topDocs().scoreDocs;
		    // 4. display results
//		    System.out.println("Found " + hitsTitle.length + " hits.");
		    int i=0;
		    for(i=0;i<hitsTitle.length;++i) {
		      int docId = hitsTitle[i].doc;
		      Document d = searcher.doc(docId);
		      TitleRankIDs.put(Integer.parseInt(d.get("id").toString()), i);
//		      System.out.println("rank="+TitleRankIDs.get(Integer.parseInt(d.get("id").toString())));
//		      System.out.println((i + 1) + "\t" + d.get("title")+"\t"+d.get("author"));
		    }
		    lastRank1=i;
		    TopScoreDocCollector collector2 = TopScoreDocCollector.create(hitsPerPage);
		    //search with the author
		    searcher.search(qAuthor, collector2);
		    ScoreDoc[] hitsAuthor = collector2.topDocs().scoreDocs;
		    // 4. display results
//		    System.out.println("Found " + hitsAuthor.length + " hits.");
		    int j=0;
		    for( j=0;j<hitsAuthor.length;++j) {
		      int docId = hitsAuthor[j].doc;
		      Document d = searcher.doc(docId);
		      int id=Integer.parseInt(d.get("id").toString());
		      AuthorRankIDs.put(id, j);
//		      System.out.println((j + 1) + d.get("author")+"\t");
		    }
		    lastRank2=j;
		    //add to the rankedBooks in order of the rank
		    Iterator<Integer> iterator1=books.keySet().iterator();
		    while(iterator1.hasNext()){
		    	int id=iterator1.next();
		    	int rank1=lastRank1;
		    	int rank2=lastRank2; 
		    	if(TitleRankIDs.containsKey(id)){
		    		rank1=TitleRankIDs.get(id);
			    	if(AuthorRankIDs.containsKey(id))
			    		rank2=AuthorRankIDs.get(id);
		    	}
		    	else{
		    		if(AuthorRankIDs.containsKey(id)){
			    		rank2=AuthorRankIDs.get(id);
			    		
		    		}
		    		else{
		    			continue;
		    		}
		    	}
		    	TitleRankIDs.put(id, (rank1+rank2)/2);
//		    	System.out.println("rank1="+rank1+" rank2="+rank2+"  rank= "+(rank1+rank2)/2+"author="+books.get(id).getAuthor()+"   title="+books.get(id).getBookTitle());
		    }
		    //这里将map.entrySet()转换成list
	        List<Map.Entry<Integer,Integer>> temp = new ArrayList<Map.Entry<Integer,Integer>>(TitleRankIDs.entrySet());
	        //然后通过比较器来实现排序
	        Collections.sort(temp,new Comparator<Map.Entry<Integer,Integer>>() {

				@Override
				public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
					return o1.getValue().compareTo(o2.getValue());
				}
			});
	        for(Map.Entry<Integer,Integer> mapping:temp){ 
	        	int id=mapping.getKey();
	        	rankedBooks.add(books.get(id));
//	        	System.out.println(books.get(id).getAuthor()+"---------"+books.get(id).getBookTitle());
	          } 
		    reader.close();
		    return rankedBooks;
	    }
	    		
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
