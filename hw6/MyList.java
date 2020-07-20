//Andrew Han 227009495
import java.util.Iterator;

public class MyList<E> implements Iterable<E>, Cloneable, Comparable<MyList<E>>{
	private MyNode<E> n;
	private MyNode<E> curr;
	private int length;
	public ListIterator<E> iterator(){
		return new ListIterator<E>(this);
	}
	public MyList(){
		this.n = new MyNode<E>();
		this.curr = new MyNode<E>();
		this.length = 0;
	}
	public MyList(Iterable<E> iterable){
		this.curr = new MyNode<E>();
		this.length = 0;
		for (E i : iterable){			
			if (this.getLength() == 0){
				this.n = new MyNode<E>(i,curr);
			}
			else if (this.getLength() == 1){
				this.curr.setData(i);
			}
			else{
				this.curr.setNext(new MyNode<E>());
				this.curr = this.curr.getNext();
				this.curr.setData(i);
			}
			this.incLength(); 
		}
	}
	public int getLength(){ return length;}
	public void incLength() {length++; }
	class ListIterator<E> implements Iterator<E> {
		private MyList<E> p;
		public ListIterator(MyList<E> l){
			this.p = l;
			p.curr = p.n;
		}
		public boolean hasNext(){
			return p.curr != null;
		}
		public E next(){
			E temp = p.curr.getData();
			p.curr = p.curr.getNext();
			return temp;
		}
	}
	@Override
	public Iterable<E> clone(){
		MyList<E> newList = new MyList<E>();
		for (E i : this){
			if (newList.getLength() == 0){
				newList.n.setData(i);
				newList.n.setNext(newList.curr);
			}
			else if (newList.getLength() == 1){
				newList.curr.setData(i);
			}
			else{
				newList.curr.setNext(new MyNode<E>());
				newList.curr = newList.curr.getNext();
				newList.curr.setData(i);
			}
			newList.incLength();
		}
		return newList;
	}
	@Override
	public int compareTo(MyList<E> a){
		if (this.getLength() < a.getLength()){
			return -1;
		}
		else if (this.getLength() == a.getLength()){
			return 0;
		}
		else{
			return 1;
		}
	}
	public int hashCode(MyList<E> n){
		return n.getLength();
	}
	public MyList<E> reverse(){
		MyNode<E> previous = null;
		this.curr = this.n;
		while (curr != null){
			MyNode<E> temp = curr.getNext();
			this.curr.setNext(previous);
			previous = this.curr;
			this.curr = temp;
		}
		this.n = previous;
		return this;
	}
	public boolean equals(MyList<E> b){
		MyList<E> thisTemp = new MyList<E>(this.clone());
		MyList<E> bTemp = new MyList<E>(b.clone());
		thisTemp.curr = thisTemp.n;
		bTemp.curr = bTemp.n;
		if (hashCode(this) == hashCode(b)){
			for (E i : this){
				for (E j : b){
					if (i == j){
						if (bTemp.curr.check() || thisTemp.curr.check()){
							bTemp.curr.setFalse();
							thisTemp.curr.setFalse();
							return false;
						}
						else {
							bTemp.curr.setTrue();
							thisTemp.curr.setTrue();
						}
					}
					bTemp.curr = bTemp.curr.getNext();
				}
				bTemp.curr = b.n;
				thisTemp.curr = thisTemp.curr.getNext();
			}
			return true;
		}
		else{
			return false;
		}
	}
	public void push (E item){
		MyNode<E> newNode = new MyNode<E>(item, this.n);
		this.n = newNode;
		this.incLength();
	}
	public E peek(){
		return this.n.getData();
	}
	public E pop(){
		E temp = this.n.getData();
		this.n = this.n.getNext();
		length--;
		return temp;
	}
	public String toString(){
		MyNode<E> curr = this.n;
		String str = "[(head: ";
		int i = 0;
		while (curr != null){
			if (i > 0){
				str += " -> (";
			}
			else{
				i++;
			}
			str += curr.getData();
			str += ")";
			curr = curr.getNext();
		}
		if (i == 0){
			str += ")";
		}
		str += "]";
		return str;
	}
}
