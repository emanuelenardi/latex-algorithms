#include <fstream>
#include <vector>
#include <queue>

using namespace std;

struct nodo {
	vector<int> vic;
	int entranti = 0;
	int lungo = 0;
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
		grafo[b].entranti++;
	}

	queue<int> sorgenti;

	for (int i = 0; i < N; i++)
		if (grafo[i].entranti == 0)
			sorgenti.push(i);

	int mx = -1;
	while (!sorgenti.empty()) {
		int p = sorgenti.front();
		sorgenti.pop();

		for (int v:grafo[p].vic) {
			grafo[v].entranti--;
			if (grafo[v].entranti == 0)
				sorgenti.push(v);
			grafo[v].lungo = max(grafo[v].lungo, grafo[p].lungo + 1);
		}

		mx = max(mx, grafo[p].lungo);
	}
	
	out << mx << endl;

	return 0;
}
