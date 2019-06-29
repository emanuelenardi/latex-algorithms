#include <fstream>
#include <iostream>
#include <vector>
#include <set>

using namespace std;

struct nodo {
	vector<int> vic;
	bool articulation;
	bool visited;
	int num;
	int low;
};

int N;
vector<nodo> grafo;
vector<int> solution;

int counter = 0;

void dfs(int node, int father);
void dfs2(int el);

int main(void) {
	int M;
	ifstream in("input.txt");

	in >> N >> M;
	grafo.resize(N);

	for (nodo &n:grafo) {
		n.visited = false;
		n.num = -1;
		n.articulation = false;
	}

	for (int i = 0; i < M; i++) {
		int a, b;
		in >> a >> b;
		grafo[a].vic.push_back(b);
		grafo[b].vic.push_back(a);
	}
	dfs(0, -1);

	for (int i = 0; i < N; i++) {
		if (!grafo[i].articulation && !grafo[i].visited) {
			art.clear();
			dfs2(i);
			if (art.size() == 1)
				solution.push_back(i);
		}
	}

	ofstream out("output.txt");
	out << solution.size() << endl;
	for (int i:solution)
		out << i << " ";
	out << endl;

	return 0;
}

void dfs(int node, int father) {
	grafo[node].num = counter;
	grafo[node].low = counter;

	counter++;

	for (int i = 0; i < grafo[node].vic.size(); i++) {
		int vicino = grafo[node].vic[i];

		if (grafo[vicino].num == -1) {
			dfs(vicino, node);
			grafo[node].low = min(grafo[node].low, grafo[vicino].low);

			if (node == 0) {
				if (i != 0)
					grafo[0].articulation = true;
			} else if (grafo[vicino].low >= grafo[node].num)
				grafo[node].articulation = true;
		} else if (vicino != father)
			grafo[node].low = min(grafo[node].low, grafo[vicino].low);
	}
}

set<int> art;

void dfs2(int el) {
	if (grafo[el].articulation)
		art.insert(el);
	else if (!grafo[el].visited) {
		grafo[el].visited = true;
		for (int v:grafo[el].vic)
			dfs2(v);
	}
}
