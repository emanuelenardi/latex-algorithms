#include <fstream>
#include <stack>
#include <vector>

using namespace std;

int N, M;

struct nodo {
	vector<int> vic;
	bool visited = false;
};

vector<nodo> grafo;
vector<nodo> grafoT; // grafo trasposto
stack<int> ordine;

void dfsG(int n);
void dfsGT(int n);

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");
	in >> N >> M;
	grafo.resize(N);
	grafoT.resize(N);

	// lettura del grafo
	for (int i = 0; i < M; i++) {
		int a, b;
		in >> a >> b;
		grafo[a].vic.push_back(b);
		grafoT[b].vic.push_back(a);
	}

	for (int i = 0; i < N; i++)
		if (!grafo[i].visited)
			dfsG(i);

	int mx = -1;
	// dfs sul grafo trasposto in ordine inverso di fine
	while (!ordine.empty()) {
		int i = ordine.top();
		ordine.pop();
		if (!grafoT[i].visited) {
			counter = 0;
			dfsGT(i);
			mx = max(mx, counter);
		}
	}

	out << mx << endl;
	return 0;
}

// dfs sul grafo originario
void dfsG(int n) {
	grafo[n].visited = true;
	for (int v:grafo[n].vic) {
		if (!grafo[v].visited)
			dfsG(v);
	}
	ordine.push(n);
}

int counter = 0;

// dfs sul grafo trasposto
void dfsGT(int n) {
	grafoT[n].visited = true;
	for (int v:grafoT[n].vic) {
		if (!grafoT[v].visited)
			dfsGT(v);
	}
	
	// numero di nodi incontrati nella visita
	counter++;
}
