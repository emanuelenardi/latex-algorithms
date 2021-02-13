public class VectorQueue implements Queue {

	/** Element vector */
	private Object[] A;

	/** Current number of elements in the queue */
	private int n;

	/** Top element of the queue */
	private int head;

	public VectorQueue(int dim) {
		n = 0;
		head = 0;
		A = new Object[dim];
	}

	public boolean isEmpty() {
		return n == 0;
	}

	public Object top() {
		if (n == 0)
			throw new IllegalStateException("Queue is empty");

		return A[head];
	}

	public Object dequeue() {
		if (n == 0)
			throw new IllegalStateException("Queue is empty");

		Object t = A[head];
		head = (head+1) % A.length;
		n = n-1;
		return t;
	}

	public void enqueue(Object v) {
		if (n == A.length)
			throw new IllegalStateException("Queue is full");

		A[(head+n) % A.length] = v;
		n = n+1;
	}
}
