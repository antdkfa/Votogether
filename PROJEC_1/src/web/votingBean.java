package web;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class votingBean {
	private ArrayList<Integer> flag = new ArrayList<Integer>();
	private ArrayList<String> major = new ArrayList<String>();
	private ArrayList<Integer> total = new ArrayList<Integer>();
	private ArrayList<Integer> vote = new ArrayList<Integer>();
	
	public votingBean(){
	}
	
	
	public Integer[] getFlag() {
		return flag.toArray(new Integer[flag.size()]);
	}

	public void setFlag(int index,Integer flag) {
		this.flag.add(index,flag);
	}

	public String[] getMajor() {
		return major.toArray(new String[major.size()]);
	}

	public void setMajor(int index,String major) {
		this.major.add(index,major);
	}
	public Integer[] getTotal() {
		return total.toArray(new Integer[total.size()]);
	}

	public void setTotal(int index,Integer total) {
		this.total.add(index,total);
	}
	public Integer[] getVote() {
		return vote.toArray(new Integer[vote.size()]);
	}

	public void setVote(int index,Integer vote) {
		this.vote.add(index,vote);
	}
	
	public int getListSize(){
		return flag.size();
	}
}