#include <fstream>
#include <vector>

using namespace std;

int C, N;
vector<int> best;

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> C >> N;

	best.resize(C + 1, -1);
	best[0] = 0;

	for (int i = 0; i < N; i++) {
		int p, v;
		in >> p >> v;
		for (int i = C; (i - p) >= 0; i--)
			if (best[i - p] > -1)
				best[i] = max(best[i], best[i - p] + v);
	}

	int res = -1;
	for (int i = 0; i <= C; i++)
		res = max(res, best[i]);
	out << res << endl;
	
	return 0;
}
