#include <fstream>
using namespace std;

int main () {
	ifstream in("input.txt");
	ofstream out("output.txt");
	
	int N;
	int mx = -1;
	int last = -1;
	int cur;

	in >> N;

	for (int i = 0; i < N; i++) {
		in >> cur;
		last = max(cur,cur+last);
		mx = max(mx,last);
	}

	out << mx << endl;

	return 0;
}
