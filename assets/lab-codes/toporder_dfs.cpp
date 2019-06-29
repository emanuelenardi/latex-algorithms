#include <fstream>
#include <stack>
#include <vector>

using namespace std;

struct nodo {
	vector<int> vic;
	bool visitato = false;
};

vector<nodo> grafo;
stack<int> ordine;

void dfs(int el);

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");
	int N, M;

	in >> N >> M;
	grafo.resize(N);

	for (int i = 0; i < M; i++) {
		int a, b;
		in >> a >> b;
		grafo[a].vic.push_back(b);
	}

	for (int i = 0; i < N; i++)
		if (!grafo[i].visitato)
			dfs(i);

	while (!ordine.empty()) {
		out << ordine.top() << endl;
		ordine.pop();
	}

	out << endl;
	return 0;
}

void dfs(int el) {
	grafo[el].visitato = true;
	for (int v:grafo[el].vic) {
		if (!grafo[v].visitato)
			dfs(v);
	}
	ordine.push(el);
}
