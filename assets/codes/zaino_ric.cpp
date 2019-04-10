#include <fstream>
#include <iostream>
#include <utility>
#include <vector>

using namespace std;

int C, N;

vector <pair<int, int>> elements;
vector <vector<int>> sav;

int ric(int c, int n);

int main(void) {
	ifstream in("input.txt");

	in >> C >> N;

	for (int i = 0; i < N; i++) {
		int p, v;
		in >> p >> v;
		elements.push_back(make_pair(p, v));
	}

	sav = vector<vector<int>> (C + 1, vector<int>(N, -1));

	ofstream out("output.txt");
	out << ric(C, N - 1) << endl;
	return 0;
}

int ric(int c, int n) {

	if (c < 0)
		return -100000000;
	if (n < 0)
		return 0;
	if (sav[c][n] != -1)
		return sav[c][n];

	int p = elements[n].first;
	int v = elements[n].second;
	sav[c][n] = max(v + ric(c - p, n - 1), ric(c, n - 1));

	return sav[c][n];
}
