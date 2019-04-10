#include <fstream>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int N, M, T;
vector <string> D;
vector <vector<int>> C;

void clean();
vector<int> solve(const vector<int> &seq);

int main() {
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> N >> M >> T;
	D.resize(N);

	for (int i = 0; i < N; i++)
		in >> D[i];

	clean();
	vector <vector<int>> Tab;
	Tab.resize(N);
	Tab[0] = solve(C[0]);

	for (int i = 1; i < N; i++) {
		vector<int> cur = solve(C[i]);
		Tab[i].resize(T + 1);

		for (int tot = 0; tot <= T; tot++)
			for (int here = 0; here <= tot; here++)
				Tab[i][tot] = max(Tab[i][tot], cur[here] + Tab[i - 1][tot - here]);
	}

	out << Tab[N - 1][T] << endl;
	return 0;
}

void clean() {
	C.resize(N);
	
	for (int i = 0; i < N; i++) {
		int count = 1;
		for (int j = 1; j < M; j++) {
			if (D[i][j] == D[i][j - 1])
				count++;
			else {
				C[i].push_back(count);
				count = 1;
			}
		}
		C[i].push_back(count);
	}
}

vector<int> solve(const vector<int> &seq) {
	int S = seq.size();
	vector <vector<int>> res(S + 1, vector<int>(T + 1, 0));

	for (int t = 1; t <= T; t++) {
		res[S - 1][t] = seq[S - 1];
		res[S][t] = 0;
	}

	for (int i = S - 2; i >= 0; i--) {
		for (int t = 1; t <= T; t++) {
			res[i][t] = res[i + 1][t];
			int cur = 0;
			for (int j = i; j < S; j += 2) {
				cur += seq[j];
				res[i][t] = max(res[i][t], res[j + 1][t - 1] + cur);
			}
		}
	}

	return res[0];
}
