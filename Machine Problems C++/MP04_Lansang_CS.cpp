#include<iostream>
#include<sstream>
#include<deque>
#include<fstream>
#include<cmath>
#include<iomanip>
using namespace std;

struct track {
	int access;
	int traverse;
};

stringstream ss;

int cylinder;
int headpos;
deque<int> q;

deque<string> o;

void fin();
void fout();
void reset();
void init(string algo);
void simulateSSTF();
void simulateSCAN();
void grapher(deque<track> ttr);
void tablemaker(deque<track> ttr);
string spacer(string s, int sp, int c);
void tableprinter(deque< deque<string> > tt);

int main() {
	while(1) {
		reset();
		fin();
		string ou = "SSTF and SCAN Disk Scheduling Algorithm\n\n\n";
		ou += "Programmed by: Cristan Kim Xavier S. Lansang\n";
		cout<<ou;
		o.push_back(ou);
		
		init("SSTF DISK SCHEDULING ALGORITHM");
		simulateSSTF();
		
		ou = "\n";
		cout<<ou;
		o.push_back(ou);
		
		init("SCAN DISK SCHEDULING ALGORITHM");
		simulateSCAN();
		fout();
		
		string ans;
		while(2) {
			cout<<"Do you want to run again [y/n]: ";
			cin>>ans;
			
			if(ans == "Y" || ans == "y") {
				cout<<endl<<endl<<endl<<endl;
				break;
			} else if(ans == "N" || ans == "n") {
				exit(0);
			}
		}
	}
}

void fin(){
    ifstream fin;
    fin.open("MP04 Checker.txt");
    int tmp;

    fin>>cylinder;
    fin>>headpos;
    while(1) {
        fin>>tmp;
		if(tmp < 0) {
			break;
		}
		q.push_back(tmp);
    }
	fin.close();
}

void fout() {
	ofstream fout;
	
	fout.open("MP04 Checker.txt", std::ios_base::app);
	fout << "\xEF\xBB\xBF";
	string spacer = "\n\n\n";
    fout.write(spacer.data(), spacer.size());
    
    for(int i = 0; i < o.size(); i++) {	
        fout.write(o[i].data(), o[i].size());
	}
	
	fout.close();
}

void reset() {
	cylinder = 0;
	headpos = 0;
	q.clear();
	o.clear();
}

void init(string algo) {
	string ou;
	
	cout<<endl<<algo<<endl;
	ou = "\n" + algo + "\n";
	cout<<"Inputs:"<<endl;
	ou += "Inputs:\n";
	cout<<"Max Cylinder Size: "<<cylinder<<endl;
	ou += "Max Cylinder Size: ";
	string sstmp;
	ss.clear();
	ss<<cylinder;
	ss>>sstmp;
	ou += sstmp + "\n";
	cout<<"Head Pointer Position: "<<headpos<<endl;
	ou += "Head Pointer Position: ";
	ss.clear();
	ss<<headpos;
	ss>>sstmp;
	ou += sstmp + "\n";
	cout<<"Queue: ";
	for(int i = 0; i < q.size(); i++) {
		cout<<q[i]<<" ";
		ss.clear();
		ss<<q[i];
		ss>>sstmp;
		ou += sstmp + " ";
	}
	cout<<"-1"<<endl<<endl;
	ou += "-1\n\n";
	
	o.push_back(ou);
}

void simulateSSTF() {
	deque<track> tr;
	deque<int> disq;
	
	disq = q;
	
	track ttmp;
	ttmp.access = headpos;
	ttmp.traverse = 0;
	tr.push_back(ttmp);
	
	while(!disq.empty()) {
		int nearestpos = 0;
		for(int i = 0; i < disq.size(); i++) {
			if(abs(disq[i] - tr[tr.size() - 1].access) < abs(disq[nearestpos] - tr[tr.size() - 1].access)) {
				nearestpos = i;
			}
		}
		
		ttmp.access = disq[nearestpos];
		tr.push_back(ttmp);
		
		disq.erase(disq.begin() + nearestpos);
	}

	grapher(tr);
	tablemaker(tr);
}

void simulateSCAN() {
	deque<track> tr;
	deque<int> disq;
	deque<int> sortedq;
	disq = q;
	
	track ttmp;
		
	while(!disq.empty()) {
		int smallestpos = 0;
		
		for(int i = 0; i < disq.size(); i++) {
			if(disq[i] < disq[smallestpos]) {
				smallestpos = i;
			}
			
		}
			sortedq.push_back(disq[smallestpos]);
			disq.erase(disq.begin() + smallestpos);		
	}

	int divide = 0;
	for(int i = 0; i < sortedq.size(); i++) {
		
		if(sortedq[i] < headpos) {
			divide = i;
		} else {
			break;
		}
	}
	
	for(int i = 0; i <= divide; i++) {
		ttmp.access = sortedq[0];
		ttmp.traverse = 0;
		tr.push_front(ttmp);
		
		sortedq.erase(sortedq.begin());
	}
	
	ttmp.access = 0;
	ttmp.traverse = 0;
	tr.push_back(ttmp);
	
	ttmp.access = headpos;
	tr.push_front(ttmp);
	
	while(!sortedq.empty()) {
		ttmp.access = sortedq[0];
		tr.push_back(ttmp);
		
		sortedq.erase(sortedq.begin());
	}
	
	grapher(tr);
	tablemaker(tr);
}

void grapher(deque<track> ttr) {
	int hor = 196; string Hor = "\u2500";
	int ver = 179; string Ver = "\u2502";
	int midleft = 195; string Midleft = "\u251C";
	int midmid = 197; string Midmid = "\u253C";
	int midright = 180; string Midright = "\u2524";
	int botleft = 192; string Botleft = "\u2514";
	int botmid = 193; string Botmid = "\u2534";
	int botright = 217; string Botright = "\u2518";
	int dot = 254; string Dot = "\u25CF";
	
	deque<int> sortedq;
	deque<int> disq = q;
	deque<int> spaces;
	deque<int> spacesdot;
	
	string ou;
	
	disq.push_front(0);
	disq.push_front(cylinder - 1);
	disq.push_front(headpos);
	
	while(!disq.empty()) {
		int smallestpos = 0;
		
		for(int i = 0; i < disq.size(); i++) {
			if(disq[i] < disq[smallestpos]) {
				smallestpos = i;
			}
			
		}
			sortedq.push_back(disq[smallestpos]);
			disq.erase(disq.begin() + smallestpos);		
	}
	
	int gap = ceil(cylinder/50.0);

	for(int i = 0; i < sortedq.size() - 1; i++) {
		int spacetmp = (sortedq[i + 1] - sortedq[i]) / gap;
		if(spacetmp == 0) {
			spacetmp = 1;
		}
		spaces.push_back(spacetmp);
	}
	
	cout<<"Output:"<<endl;
	cout<<"Graph"<<endl;
	ou = "Output:\n";
	ou += "Graph\n";
	
	cout<<" ";
	ou += " ";
	for(int i = 0; i < sortedq.size(); i++) {
		cout<<sortedq[i];
		string sstmp;
		ss.clear();
		ss<<sortedq[i];
		ss>>sstmp;
		ou += sstmp;
		if(i != sortedq.size() - 1) {		
			for(int j = 0; j < spaces[i]; j++) {
				cout<<" ";
				ou += " ";
			}
		}
	}
	cout<<endl;
	ou += "\n";
	
	spacesdot = spaces;
	for(int i = 0; i < sortedq.size() - 1; i++) {
		int no = 0;
		int num = sortedq[i + 1];
		while(num != 0) {
			num = floor(num / 10.0);
			no++;
		}

		int left = ceil((no + 1) / 2.0) - 1;
		int right = no - left - 1;
		
		if(i != sortedq.size() - 2) {
			spacesdot[i] += left;
		}
		spacesdot[i + 1] += right;
	}
	
	cout<<" "<<char(midleft);
	ou += " " + Midleft;
	for(int i = 0; i < sortedq.size(); i++) {
		if(i != sortedq.size() - 1) {
			for(int j = 0; j < spacesdot[i]; j++) {
				cout<<char(hor);
				ou += Hor;
			}
			if(i != spacesdot.size() - 1) {
				cout<<char(botmid);
				ou += Botmid;
			} else {
				cout<<char(midright);
				ou += Midright;
			}
		}
	}	
	cout<<endl;
	ou += "\n";
	
	
	for(int x = 0; x < ttr.size(); x++) {
		cout<<" "<<char(ver);
		ou += " " + Ver;
		for(int i = 0; i < sortedq.size(); i++) {
			if(i != sortedq.size() - 1) {
				for(int j = 0; j < spacesdot[i]; j++) {
					cout<<" ";
					ou += " ";
				}
				if(i != spacesdot.size() - 1) {
					cout<<" ";
					ou += " ";
				} else {
					cout<<char(ver);
					ou += Ver;
				}
			}
		}	
		cout<<endl;
		ou += "\n";
		
		cout<<" ";
		ou += " ";
		for(int i = 0; i < sortedq.size(); i++) {
			if(ttr[x].access == sortedq[i]) {
				cout<<char(dot);
				ou += Dot;
			} else if(sortedq[i] == 0 || sortedq[i] == (cylinder - 1)) {
				cout<<char(ver);
				ou += Ver;
			} else {
				cout<<" ";
				ou += " ";
			}
			if(i != sortedq.size() - 1) {
				for(int j = 0; j < spacesdot[i]; j++) {
					cout<<" ";
					ou += " ";
				}
			}
		}
		cout<<endl;
		ou += "\n";
	}
	
		cout<<" "<<char(ver);
		ou += " " + Ver;
		for(int i = 0; i < sortedq.size(); i++) {
			if(i != sortedq.size() - 1) {
				for(int j = 0; j < spacesdot[i]; j++) {
					cout<<" ";
					ou += " ";
				}
				if(i != spacesdot.size() - 1) {
					cout<<" ";
					ou += " ";
				} else {
					cout<<char(ver);
					ou += Ver;
				}
			}
		}	
		cout<<endl;
		ou += "\n";
		
		cout<<" "<<char(botleft);
		ou += " " + Botleft;
		for(int i = 0; i < sortedq.size(); i++) {
			if(i != sortedq.size() - 1) {
				for(int j = 0; j < spacesdot[i]; j++) {
					cout<<char(hor);
					ou += Hor;
				}
				if(i != spacesdot.size() - 1) {
					cout<<char(hor);
					ou += Hor;
				} else {
					cout<<char(botright);
					ou += Botright;
				}
			}
		}	
		cout<<endl;
		ou += "\n";
		
		o.push_back(ou);
}

void tablemaker(deque<track> ttr) {
	int begpos = -1;
	int laspos = -1;
	for(int i = 0; i < ttr.size(); i++) {
		if(ttr[i].access == 0) {
			begpos = i;
		} else if(ttr[i].access == (cylinder - 1)) {
			laspos = i;
		}
	}
	
	if(begpos != -1) {
		ttr.erase(ttr.begin() + begpos);
	}
	if(laspos != -1) {
		ttr.erase(ttr.begin() + laspos);
	}
	
	for(int i = 1; i < ttr.size(); i++) {
		ttr[i].traverse = abs(ttr[i].access - ttr[i - 1].access);
	}
	
	int tot = 0;
	float ave = 0.0;
	
	deque< deque<string> > t;
	deque<string> tc;
	
	tc.push_back("Next Track Accessed");
	tc.push_back("Next Track Traversed");
	t.push_back(tc);
	tc.clear();
	
	for(int i = 0; i < ttr.size(); i++) {
		tc.clear();
		string tmp;
		ss.clear();
		ss << ttr[i].access;
		ss >> tmp;
		tc.push_back(tmp);
		if(ttr[i].traverse != 0) {
			ss.clear();
			ss << ttr[i].traverse;
			ss >> tmp;
			tc.push_back(tmp);
			
			tot += ttr[i].traverse;
		}
		t.push_back(tc);
	}
	ave += tot;
	ave /= (ttr.size() -1);
		
	tc.clear();
	tc.push_back("Total");
	string tmp;
	ss.clear();
	ss << tot;
	ss >> tmp;
	tmp += " cylinders";
	tc.push_back(tmp);
	t.push_back(tc);
	
	tc.clear();
	tc.push_back("Average");
	
	ss.clear();
	if(ceil(ave) != floor(ave)) {
		ss << fixed << setprecision(2) << ave;
	} else {
		ss << fixed << setprecision(0) << ave;
	}
	ss >> tmp;
	tc.push_back(tmp);
	t.push_back(tc);
	
	tableprinter(t);
}
string spacer(string s, int sp, int c) {
	int left;
	int right;
	string ss;
	
	left = (sp - s.length())/2;
	right = (sp - s.length())/2;
	
	if((left + right + s.length()) != sp) {
		if(sp % 2 == 0) {
			left++;
		} else{
			right++;
		}
	}

	left = left + c;
	right = right + c;
	
	for(int i = 0; i < left; i++) {
		ss += " ";
	}
	ss += s;
	
	for(int i = 0; i < right; i++) {
		ss += " ";
	}
	
	return ss;
}

void tableprinter(deque< deque<string> > tt) {
	string ou;
	int rc;
	int cc = 0;
	
	deque<int> sp;
	
	int topleft = 218; string Topleft = "\u250C";
	int topmid = 194; string Topmid = "\u252C";
	int topright = 191; string Topright = "\u2510";
	int hor = 196; string Hor = "\u2500";
	int ver = 179; string Ver = "\u2502";
	int midleft = 195; string Midleft = "\u251C";
	int midmid = 197; string Midmid = "\u253C";
	int midright = 180; string Midright = "\u2524";
	int botleft = 192; string Botleft = "\u2514";
	int botmid = 193; string Botmid = "\u2534";
	int botright = 217; string Botright = "\u2518";
	
	
	rc = tt.size();

	for(int i = 0; i < tt.size(); i++) {
		if(cc < tt[i].size()) {
			cc = tt[i].size();
		}
	}
	
	for(int i = 0; i < cc; i++) {
		sp.push_back(0);
	}

	for(int i = 0; i < tt.size(); i++) {
		for(int j = 0; j < tt[i].size(); j++) {
			if(sp[j] < tt[i][j].size()) {
				sp[j] = tt[i][j].size();
			}
		}
	}
	
	cout<<"Table"<<endl;
	ou = "Table\n";
	
	cout<<" "<<char(topleft);
	ou += " " + Topleft;
	for(int i = 0; i < sp.size(); i++) {
		for(int j = 0; j < sp[i]; j++) {
			cout<<char(hor);
			ou += Hor;
		}
		if(i != sp.size() -1) {
			cout<<char(topmid);
			ou += Topmid;
		}
	}
	cout<<char(topright)<<endl;
	ou += Topright + "\n";
	
	for(int i = 0; i < tt.size(); i++) {
		cout<<" "<<char(ver);
		ou += " " + Ver;
		for(int j = 0; j < sp.size(); j++) {
			if(j > tt[i].size() - 1) {
				for(int k = 0; k < sp[j]; k++) {
					cout<<" ";
					ou += " ";
				}
			} else {
				string temp = spacer(tt[i][j],sp[j],0);
				cout<<temp;
				ou += temp;
			}
			cout<<char(ver);
			ou += Ver;	
		}
		cout<<endl;
		ou += "\n";
		if(i != tt.size() - 1) {
			cout<<" "<<char(midleft);
			ou += " " + Midleft;
			for(int j = 0; j < sp.size(); j++) {
				for(int k = 0; k < sp[j]; k++) {
					cout<<char(hor);
					ou += Hor;
				}
				if(j != sp.size() -1) {
					cout<<char(midmid);
					ou += Midmid;
				}
			}
			cout<<char(midright)<<endl;
			ou += Midright + "\n";
		}
	}
	
	cout<<" "<<char(botleft);
	ou += " " + Botleft;
	for(int i = 0; i < sp.size(); i++) {
		for(int j = 0; j < sp[i]; j++) {
			cout<<char(hor);
			ou += Hor;
		}
		if(i != sp.size() -1) {
			cout<<char(botmid);
			ou += Botmid;
		}
	}
	cout<<char(botright)<<endl;
	ou += Botright + "\n";
	
	o.push_back(ou);
}

