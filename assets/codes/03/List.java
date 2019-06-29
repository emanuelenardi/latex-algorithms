class Pos {
	Pos succ;	/** Next element of the list */
	Pos pred;	/** Previous element of the list */
	Object v;	/** Value */

	Pos(Object v) {
		succ = pred = null;
		this.v = v;
	}
}

public class List {
	private Pos head;		/** First element of the list */
	private Pos tail;		/** Last element of the list */

	public List() {
		head = tail = null;
	}

	public Pos head()                  { return head; }
	public Pos tail()                  { return tail; }
	public boolean finished(Pos pos)   { return pos == null; }
	public boolean isEmpty()           { return head == null; }
	public Object read(Pos p)          { return p.v; }
	public void write(Pos p, Object v) { p.v = v; }

	public Pos next(Pos pos) {
		return (pos != null ? pos.succ : null);
	}

	public Pos prev(Pos pos) {
		return (pos != null ? pos.pred : null);
	}

	public void remove(Pos pos) {
		if (pos.pred == null) // sto inserendo in testa
			head = pos.succ;
		else
			pos.pred.succ = pos.succ;

		if (pos.succ == null) // sto inserendo in coda
			tail = pos.pred;
		else
			pos.succ.pred = pos.pred;
	}

	public Pos insert(Pos pos, Object v) {
		Pos t = new Pos(v);

		if (head == null) {
			head = tail = t; // Insert in a emtpy list
		} else if (pos == null) {
			t.pred = tail; // Insert at the end
			tail.succ = t;
			tail = t;
		} else {
			t.pred = pos.pred; // Insert in front of an existing position
			if (t.pred != null)
				t.pred.succ = t;
			else
				head = t;

			t.succ = pos;
			pos.pred = t;
	}

		return t;
	}
}
