public class VectorStack implements Stack {

	/** Vector containing the elements */
	private Object[] A;

	/** Number of elements in the stack */
	private int n;

	public VectorStack(int dim) {
		n = 0;
		A = new Object[dim];
	}

	public boolean isEmpty() {
		return n == 0;
	}

	public Object top() {
		if (n == 0)
			throw new IllegalStateException("Stack is empty");

		return A[n-1];
	}

	public Object pop() {
		if (n == 0)
			throw new IllegalStateException("Stack is empty");

		return A[--n];
	}

	public void push(Object o) {
		if (n == A.length)
			throw new IllegalStateException("Stack is full");

		A[n++] = o;
	}

}
