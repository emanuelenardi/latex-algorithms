#include <fstream>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

struct nodo {
	vector<int> adj;
	int dist; // la distanza fra S e il nodo
	int num; // il no. di percorsi di lunghezza minima
};

vector <nodo> grafo;
// il no. dei nodi deve essere visibile anche alla proc. bfs
int N;

void bfs(int st);

int main(void) {
	ifstream in("input.txt");
	int M, S, T;
	in >> N >> M >> S >> T;
	grafo.resize(N);

	// Lettura del grafo
	for (int i = 0; i < M; i++) {
		int f, t;
		in >> f >> t;
		grafo[f].adj.push_back(t);
	}

	bfs(S);

	ofstream out("output.txt");
	out << grafo[T].dist << " " << grafo[T].num << endl;
	return 0;
}

void bfs(int st) {
	// inizializzazione
	for (int i = 0; i < N; i++) {
		grafo[i].dist = -1;
		grafo[i].num = 0;
	}
	grafo[st].dist = 0;
	grafo[st].num = 1;

	queue<int> q;
	q.push(st);
	while (!q.empty()) {
		int cur = q.front();
		q.pop();
		// Per ogni nodo, guarda i suoi vicini
		for (int vic:grafo[cur].adj) {
			if (grafo[vic].dist == -1) {
				// il nodo non é stato ancora visto
				grafo[vic].dist = grafo[cur].dist + 1; // aggiorna distanza
				q.push(vic); // inserisci nella coda
			}
			if (grafo[vic].dist == grafo[cur].dist + 1)
				// il nodo è un predecessore di vic
				grafo[vic].num += grafo[cur].num; // aggiorno il numero di cammini
		}
	}
}
