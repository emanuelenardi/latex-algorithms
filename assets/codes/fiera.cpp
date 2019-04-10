#include <fstream>
#include <iostream>
#include <vector>
#include <cstdlib>

using namespace std;

struct nodo {
	vector<int> figli;
	vector<int> dist;
	int fratello;
	int primogenito;
	int birra;
	int d;

	nodo() {
		fratello = -1;
	}
};


int N, K;
vector <nodo> albero;
int sav[201][201][201];

int solve(int n, int last, int k);
void computeDist(int n, int dist);
void read();

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");

	read();

	for (int i = 0; i < N; i++)
		for (int j = 0; j < N; j++)
			for (int k = 0; k <= N; k++)
				sav[i][j][k] = -1;

	computeDist(0, 0);

	for (int i = 0; i < N; i++) {
		if (albero[i].figli.size() == 0)
			albero[i].primogenito = -1;
		else
			albero[i].primogenito = albero[i].figli[0];
		for (int j = 0; j + 1 < albero[i].figli.size(); j++) {
			albero[albero[i].figli[j]].fratello = albero[i].figli[j + 1];
		}
	}

	out << solve(0, 0, K) << endl;
	return 0;
}

int solve(int n, int last, int k) {
	if (n == -1)
		return 0;
	if (sav[n][last][k] != -1)
		return sav[n][last][k];
	int sol = 2 << 29;
	int mysolP, mysolN;
	for (int mk = 0; mk <= k; mk++) {
		mysolN = albero[n].birra * (albero[n].d - albero[last].d) +
				 solve(albero[n].primogenito, last, mk) +
				 solve(albero[n].fratello, last, k - mk);
		if (mk > 0)
			mysolP = solve(albero[n].primogenito, n, mk - 1) +
					 solve(albero[n].fratello, last, k - mk);
		else
			mysolP = mysolN;
		sol = min(sol, min(mysolP, mysolN));
	}
	sav[n][last][k] = sol;
	return sol;
}

void computeDist(int n, int dist) {
	albero[n].d = dist;
	for (int i = 0; i < albero[n].figli.size(); i++)
		computeDist(albero[n].figli[i], dist + albero[n].dist[i]);
}


void read() {
	in >> N >> K;
	albero.resize(N);

	for (int i = 0; i < N; i++)
		in >> albero[i].birra;

	for (int i = 0; i < N - 1; i++) {
		int f, t, p;
		in >> f >> t >> p;
		albero[f].figli.push_back(t);
		albero[f].dist.push_back(p);
	}
}
