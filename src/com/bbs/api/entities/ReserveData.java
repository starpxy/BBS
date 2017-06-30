package com.bbs.api.entities;

public class ReserveData implements DataUtil{
	private KeyWord first;
	private KeyWord type;
	private KeyWord name;
	private KeyWord productType;
	private KeyWord serviceName;
	private KeyWord time;
	private KeyWord remark;

	public ReserveData(KeyWord first, KeyWord type, KeyWord name, KeyWord productType, KeyWord serviceName,
			KeyWord time, KeyWord remark) {
		super();
		this.first = first;
		this.type = type;
		this.name = name;
		this.productType = productType;
		this.serviceName = serviceName;
		this.time = time;
		this.remark = remark;
	}

	public KeyWord getFirst() {
		return first;
	}

	public void setFirst(KeyWord first) {
		this.first = first;
	}

	public KeyWord getType() {
		return type;
	}

	public void setType(KeyWord type) {
		this.type = type;
	}

	public KeyWord getName() {
		return name;
	}

	public void setName(KeyWord name) {
		this.name = name;
	}

	public KeyWord getProductType() {
		return productType;
	}

	public void setProductType(KeyWord productType) {
		this.productType = productType;
	}

	public KeyWord getServiceName() {
		return serviceName;
	}

	public void setServiceName(KeyWord serviceName) {
		this.serviceName = serviceName;
	}

	public KeyWord getTime() {
		return time;
	}

	public void setTime(KeyWord time) {
		this.time = time;
	}

	public KeyWord getRemark() {
		return remark;
	}

	public void setRemark(KeyWord remark) {
		this.remark = remark;
	}

}
