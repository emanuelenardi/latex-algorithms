#include <fstream>
#include <vector>
#include <climits>

using namespace std;
vector<int> vec;

// le posizioni sono state processate
vector<bool> vis;

int main(void) {
	ifstream in("input.txt");
	int N;

	in >> N;

	vec.resize(N + 1);
	vis.resize(N + 1, false);
	for (int i = 1; i <= N; i++)
		in >> vec[i];

	int mosse = 0;
	int prezzo = 0;
	for (int i = 1; i <= N; i++) {
		if (!vis[i]) {
			// non abbiamo ancora lavorato con questa posizione
			if (vec[i] != i) {
				// la somma del ciclo di posizioni
				int sum = 0;
				// il piú piccolo degli interi di questo ciclo
				int mn = INT_MAX;
				int cur = i;
				int num = 0;
				while (!vis[vec[cur]]) {
					mn = min(mn, vec[cur]);
					sum += vec[cur];
					vis[vec[cur]] = true;
					cur = vec[cur];
					num++;
				}

				// prezzo senza "prendere in prestito"
				int cp = (num - 1) * mn + sum - mn;

				// prezzo prendendo in prestito
				if (mn != 1)
					cp = min(cp, 2 * (1 + mn) + num - 1 + sum - mn);
				prezzo += cp;
				// un ciclo di num interi ha bisogno di num-1 mosse
				mosse += num - 1;
			}
			vis[i] = true;
		}
	}

	ofstream out("output.txt");
	out << mosse << " " << prezzo << endl;
	return 0;
}
