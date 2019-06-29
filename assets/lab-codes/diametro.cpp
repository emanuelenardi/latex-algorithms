#include <fstream>
#include <vector>
#include <queue>

using namespace std;

struct nodo {
	vector<int> adj;					// contiene i nodi adiacenti a quello corrente
	int dist;							// conterrà la distanza dal nodo di partenza
};

// il grafo viene rappresentato tramite lista di adiacenza
vector<nodo> grafo;
int maxdist = -1;
int N, M;

void bfs(int st);

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");
	in >> N >> M;
	grafo.resize(N);

	// Lettura del grafo
	for (int i = 0; i < M; i++) {
		int f, t;
		in >> f >> t;
		grafo[f].adj.push_back(t);		// Aggiunge il 2° nodo alla lista di adicenza del 1°
		grafo[t].adj.push_back(f);		// Aggiunge il 1° nodo alla lista di adicenza del 2°
	}

	// BFS da ogni nodo
	for (int i = 0; i < N; i++)			// Per ogni nodo presente nel grafo
		bfs(i);							// Effettuo una visita in ampiezza
	out << maxdist << endl;

	return 0;
}

void bfs(int st) {
	// ogni nodo ha distanza -1, a parte il nodo di partenza che ha distanza 0
	for (nodo &n:grafo)
		n.dist = -1;
	grafo[st].dist = 0;

	queue<int> q;
	q.push(st);
	int cur;
	while (!q.empty()) {
		cur = q.front();
		q.pop();

		for (int vic:grafo[cur].adj) {
			if (grafo[vic].dist == -1) {
				// il nodo non é ancora stato visitato

				grafo[vic].dist = grafo[cur].dist + 1; // imposto la sua distanza
				q.push(vic);
			}
		}
	}

	// aggiorno la distanza massima con la distanza dell'ultimo nodo visitato
	maxdist = max(maxdist, grafo[cur].dist);
}
