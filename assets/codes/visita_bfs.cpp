#include <fstream>
#include <vector>
#include <queue>

using namespace std;

struct nodo {
	vector<int> adj;
	bool visited = false;
};

vector<nodo> grafo;
int count = 0;

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");
	int N, M, S;

	in >> N >> M >> S;
	grafo.resize(N);

	// Lettura del grafo
	for (int i = 0; i < M; i++) {
		int f, t;
		in >> f >> t;
		grafo[f].adj.push_back(t);
	}

	queue<int> q;
	q.push(S);
	while (!q.empty()) {
		int n = q.front();
		q.pop();
		if (grafo[n].visited)
			// abbiamo giá visitato il nodo, ignoriamolo
			continue;
		grafo[n].visited = true;
		count++;
		
		// visita tutti i vicini
		for (int v:grafo[n].adj)
			q.push(v);
	}

	out << count << endl;
	return 0;
}
