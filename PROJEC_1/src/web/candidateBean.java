package web;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class candidateBean {
	private ArrayList<Integer> candidatenum = new ArrayList<Integer>();
	private ArrayList<String> name = new ArrayList<String>();
	private ArrayList<String> promise1 = new ArrayList<String>();
	private ArrayList<String> promise2 = new ArrayList<String>();
	private ArrayList<Integer> candidateVoted = new ArrayList<Integer>();
	
	public candidateBean(){
	}
	
	
	public Integer[] getCandidatenum() {
		return candidatenum.toArray(new Integer[candidatenum.size()]);
	}

	public void setCandidatenum(int index,Integer candidatenum) {
		this.candidatenum.add(index,candidatenum);
	}

	public String[] getName() {
		return name.toArray(new String[name.size()]);
	}

	public void setName(int index,String name) {
		this.name.add(index,name);
	}

	public String[] getPromise1() {
		return promise1.toArray(new String[promise1.size()]);
	}

	public void setPromise1(int index,String promise1) {
		this.promise1.add(index,promise1);
	}

	public String[] getPromise2() {
		return promise2.toArray(new String[promise2.size()]);
	}

	public void setPromise2(int index,String promise2) {
		this.promise2.add(index,promise2);
	}

	public Integer[] getCandidateVoted() {
		return candidateVoted.toArray(new Integer[candidateVoted.size()]);
	}

	public void setCandidateVoted(int index,Integer candidateVoted) {
		this.candidateVoted.add(index,candidateVoted);
	}
	public int getListSize(){
		return candidatenum.size();
	}
}
