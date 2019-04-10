#include <cassert>
#include <fstream>
#include <iostream>
#include <vector>
#include <set>
#include <queue>
#include <stack>

using namespace std;

#ifdef EVAL
ifstream in("input.txt");
ofstream out("output.txt");
#else
istream &in(cin);
ostream &out(cout);
#endif

struct nodo {
	vector<int> vic;
	int count = 0;
	int incoming = 0;
	int id = 0;
	int np = 0;
	int component = -1;
	bool instack = false;
	int index = -1;
	int low;
};

vector<nodo> grafo;
vector<nodo> compgraph;
int N, E;
int V, C;

void read();
void dfs(int n);
void execute(vector<nodo> &g);
void createsubgraph();

int main() {

	read();

	for (int i = 0; i < N; i++) {
		if (grafo[i].index == -1) {
			dfs(i);
		}
	}

	createsubgraph();

	V = grafo[V].component;
	C = grafo[C].component;

	execute(compgraph);

	return 0;
}

void read() {
	in >> N >> E >> V >> C;
	grafo.resize(N);
	for (int i = 0; i < E; i++) {
		int s, t;
		in >> s >> t;
		grafo[s].vic.push_back(t);
		grafo[t].incoming++;
	}
}

stack<int> st;
int counter = 0;
int components = 0;

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
		// Trovato una componente fortemente connessa
		int el;
		do {
			el = st.top();
			st.pop();
			grafo[el].instack = false;
			grafo[el].component = components;
		} while (el != n);
		components++;
	}
}

void execute(vector<nodo> &g) {
	queue<int> q;

	for (auto &n:g)
		for (int vic:n.vic)
			g[vic].incoming++;

	for (unsigned int i = 0; i < g.size(); i++)
		if (g[i].incoming == 0)
			q.push(i);

	vector<int> ordinamento;
	int st = 0;
	while (!q.empty()) {
		int cur = q.front();
		q.pop();
		if (cur == V)
			st = ordinamento.size();
		ordinamento.push_back(cur);
		for (int v:g[cur].vic) {
			g[v].incoming--;
			if (g[v].incoming == 0) {
				q.push(v);
			}
		}
	}

	g[V].np = 1;
	for (int i = st; i < ordinamento.size(); i++) {
		int cur = ordinamento[i];
		for (int v:g[cur].vic) {
			assert(((int) (g[cur].np + g[v].np)) >= g[v].np);
			g[v].np += g[cur].np;
		}
	}

	out << g[C].np << endl;
}

void createsubgraph() {
	compgraph.resize(components);

	for (int i = 0; i < N; i++) {
		auto &n = grafo[i];
		int comp = n.component;

		for (int &vic:n.vic) {
			if (comp != grafo[vic].component) {
				compgraph[comp].vic.push_back(grafo[vic].component);
			}
		}
	}
}
