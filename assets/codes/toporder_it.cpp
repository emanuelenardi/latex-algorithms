#include <fstream>
#include <queue>
#include <vector>

using namespace std;

struct nodo {
	vector<int> vic;
	// manteniamo il numero di archi entranti
	int entranti = 0;
};

vector<nodo> grafo;

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
		// aggiorniamo il numero di archi entranti
		grafo[b].entranti++;
	}

	queue<int> sorgenti;

	for (int i = 0; i < N; i++)
		if (grafo[i].entranti == 0)
			// non ha archi entranti, é una sorgente.
			sorgenti.push(i);

	while (!sorgenti.empty()) {
		int p = sorgenti.front();
		sorgenti.pop();
		// abbiamo trovato p, ora lo rimuoviamo
		out << p << " ";

		// Per ogni vicino
		for (int v:grafo[p].vic) {

			// aggiorniamo il numero di archi entranti
			grafo[v].entranti--;
			if (grafo[v].entranti == 0)
				// non ha archi entranti, v é diventato una sorgente
				sorgenti.push(v);
		}
	}

	out << endl;
	return 0;
}
