#include <fstream>
#include <vector>

using namespace std;

int N;
vector<int> vec;
vector<int> P;

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");
	in >> N;

	for (int i = 0; i < N; i++) {
		int el;
		in >> el;
		vec.push_back(el);
	}

	P.resize(N);

	int m = 0;
	for (int i = 0; i < N; i++) {
		P[i] = vec[i];
		for (int k = 0; k < i; k++)
			if (vec[k] <= vec[i])
				P[i] = max(P[i], vec[i] + P[k]);
		m = max(m, P[i]);
	}

	out << m << endl;
	return 0;
}
