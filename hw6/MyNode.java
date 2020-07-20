
//Andrew Han 227009495

import java.util.Iterator;
import java.util.NoSuchElementException;

public final class MyNode<E> implements Iterable<E>{
	private E data; 
	private MyNode<E> next;
	private boolean counted;
	public MyNode (){
		this.data = null;
		this.next = null;
		this.counted = false;
	}
	public MyNode (E val, MyNode<E> node) {
		this.data = val;
		this.next = node;
		this.counted = false;
	}
	public E getData(){
		return this.data;
	}
	public MyNode<E> getNext(){
		return this.next;
	}
	public void setData(E val){
		this.data = val;
	}
	public void setNext(MyNode<E> node){
		this.next = node;
	}
	public boolean check(){
		return counted;
	}
	public void setTrue(){
		this.counted = true;
	}
	public void setFalse(){
		this.counted = false;
	}
	class MyNodeIterator<E> implements Iterator<E>{
		private MyNode<E> p;
		public MyNodeIterator(MyNode<E> n){
			this.p = n;
		}
		public boolean hasNext(){
			return p != null;
		}
		public E next(){
			E temp = p.getData();
			p = p.getNext();
			return temp;
		}
	}
	public MyNodeIterator<E> iterator(){
		return new MyNodeIterator<E>(this);
	}	
}