package com.bbs.po;

public class SelectorDict {
	private Integer dict_id;
	private String dict_type_code;
	private String dict_type_name;
	private String dict_item_code;
	private String dict_item_name;
	private String dict_order_code;
	private String dict_parent_code;
	private String dict_memo;
	public Integer getDict_id() {
		return dict_id;
	}
	public void setDict_id(Integer dict_id) {
		this.dict_id = dict_id;
	}
	public String getDict_type_code() {
		return dict_type_code;
	}
	public void setDict_type_code(String dict_type_code) {
		this.dict_type_code = dict_type_code;
	}
	public String getDict_type_name() {
		return dict_type_name;
	}
	public void setDict_type_name(String dict_type_name) {
		this.dict_type_name = dict_type_name;
	}
	public String getDict_item_code() {
		return dict_item_code;
	}
	public void setDict_item_code(String dict_item_code) {
		this.dict_item_code = dict_item_code;
	}
	public String getDict_item_name() {
		return dict_item_name;
	}
	public void setDict_item_name(String dict_item_name) {
		this.dict_item_name = dict_item_name;
	}
	public String getDict_order_code() {
		return dict_order_code;
	}
	public void setDict_order_code(String dict_order_code) {
		this.dict_order_code = dict_order_code;
	}
	public String getDict_parent_code() {
		return dict_parent_code;
	}
	public void setDict_parent_code(String dict_parent_code) {
		this.dict_parent_code = dict_parent_code;
	}
	public String getDict_memo() {
		return dict_memo;
	}
	public void setDict_memo(String dict_memo) {
		this.dict_memo = dict_memo;
	}
	@Override
	public String toString() {
		return "SelectorDict [dict_id=" + dict_id + ", dict_type_code=" + dict_type_code + ", dict_type_name="
				+ dict_type_name + ", dict_item_code=" + dict_item_code + ", dict_item_name=" + dict_item_name
				+ ", dict_order_code=" + dict_order_code + ", dict_parent_code=" + dict_parent_code + ", dict_memo="
				+ dict_memo + "]";
	}
}
