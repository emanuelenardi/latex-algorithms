#include <fstream>
#include <stack>
#include <vector>

using namespace std;

int N, M;

struct nodo {
	vector<int> vic;
	int index = -1;       // indice della dfs
	int low;              // indice più basso utilizzando al massimo un back edge
	bool instack = false;
};

vector<nodo> grafo;
stack<int> st;
int counter = 0;
int mx = -1;

void dfs(int n);

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> N >> M;
	grafo.resize(N);
	for (int i = 0; i < M; i++) {
		int a, b;
		in >> a >> b;
		grafo[a].vic.push_back(b);
	}

	// eseguo una dfs da tutti i nodi non visitati
	for (int i = 0; i < N; i++) {
		if (grafo[i].index == -1) {
			dfs(i);
		}
	}

	out << mx << endl;
	return 0;
}

void dfs(int n) {
	grafo[n].index = counter;
	grafo[n].low = counter;
	counter++;
	st.push(n);
	grafo[n].instack = true;

	for (int v:grafo[n].vic) {
		if (grafo[v].index == -1) {
			dfs(v);
			grafo[n].low = min(grafo[n].low, grafo[v].low);
		} else if (grafo[v].instack) {
			grafo[n].low = min(grafo[n].low, grafo[v].index);
		}
	}

	if (grafo[n].low == grafo[n].index) {
		// ho trovato una componente fortemente connessa
		int el;
		int num = 0;
		do {
			el = st.top();
			st.pop();
			grafo[el].instack = false;
			num++;
		} while (el != n);

		mx = max(mx, num);
	}
}
