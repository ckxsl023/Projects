#include <iostream>
#include <fstream>
#include <deque>
#include <sstream>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

struct strdis {
	string str;
	int age;
	int nexocc;
};

struct framedesc {
	string str;
	bool fault;
};

int refsize;
deque<string> ref;
int framesize;

deque<string> o;
stringstream ss;

void fin();
void init();
void reset();
void fout();
void simulateLRU();
void simulateOPTIMAL();
void printer(string algo, deque<framedesc> flatframe, int pagefault);
void appendOPTIMAL();
int predict(int pg[], vector<int>& fr, int pn, int index);
bool search(int key, vector<int>& fr);

int main() {
	while(1) {
		reset();
		fin();
		init();
		simulateLRU();
		simulateOPTIMAL();
		
		fout();
		appendOPTIMAL();
		string ans;
		while(1) {
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

void fin() {
	ifstream fin;
	fin.open("MP03 Checker.txt");
	string tmp;

	fin>>refsize;
	for (int i = 0; i < refsize; i++) {
		fin >> tmp;
		ref.push_back(tmp);
	}
	fin>>framesize;
	fin.close();
}

void init() {
	string ou;
	
	ou = "Programmed by: Cristan Kim Xavier S. Lansang\n";
	ou += "MP03 - LRU and OPTIMAL PAGE REPLACEMENT\n\n";
	
	ou += "enter reference string size: ";
	string tmp;
	ss.clear();
	ss<<refsize;
	ss>>tmp;
	ou += tmp + "\n";
	
	ou += "enter reference string: ";
	for(int i = 0; i < ref.size(); i++) {
		ou += ref[i] + " ";
	}
	
	ou += "\nFrame Size: ";
	ss.clear();
	ss<<framesize;
	ss>>tmp;
	ou += tmp + "\n";
	
	cout<<ou;
	o.push_back(ou);
}

void reset() {
	refsize = 0;
	ref.clear();
	framesize = 0;
	o.clear();
}

void fout() {
	ofstream fout;
	
	fout.open("MP03 Checker.txt", std::ios_base::app);
	fout << "\xEF\xBB\xBF";
	string spacer = "\n\n\n";
    fout.write(spacer.data(), spacer.size());
    
    for(int i = 0; i < o.size(); i++) {	
        fout.write(o[i].data(), o[i].size());
	}
	
	fout.close();
}

void simulateLRU() {
	deque<string> refLRU;
	deque<strdis> workingframe;
	deque<framedesc> flatframe;
	
	int pagefault = 0;
	int pagefaultbool = false;
	int actionplan;
	
	refLRU = ref;
	for(int i = 0; i < framesize; i++) {
		strdis strdistmp;
		strdistmp.str = " ";
		strdistmp.age = 0;
		workingframe.push_back(strdistmp);
	}
	
	while(!refLRU.empty()) {
		
		for(int i = 0; i < workingframe.size(); i++) {
			if(workingframe[i].str == refLRU[0]) {
				actionplan = 1;
				break;
			} else if(workingframe[i].str == " ") {
				actionplan = 2;
				break;
			} else {
				actionplan = 3;
			}
		}
		
		switch(actionplan) {
			case 1:
				for(int i = 0; i < workingframe.size(); i++) {
					if(workingframe[i].str == refLRU[0]) {
						workingframe[i].age = 0;						
						break;
					}
				}
				
				refLRU.erase(refLRU.begin());
				pagefault += 0;
				pagefaultbool = false;
				break;
			case 2:
				for(int i = 0; i < workingframe.size(); i++) {
					if(workingframe[i].str == " ") {
						workingframe[i].str = refLRU[0];
						workingframe[i].age = 0;				
						break;
					}
				}
				
				refLRU.erase(refLRU.begin());
				pagefault += 1;
				pagefaultbool = true;
				break;
			case 3:
				int oldestpos = 0;
				for(int i = 0; i < workingframe.size(); i++) {
					if(workingframe[i].age > workingframe[oldestpos].age) {
						oldestpos = i;
					}
				}
				
				workingframe[oldestpos].str = refLRU[0];
				workingframe[oldestpos].age = 0;
				
				refLRU.erase(refLRU.begin());				
				pagefault += 1;
				pagefaultbool = true;
				break;
		}
		
		for(int i = 0; i < workingframe.size(); i++) {
			if(workingframe[i].str != " ") {
				workingframe[i].age++;
			}
		}
		
		for(int i = 0; i < workingframe.size(); i++) {
			framedesc ftmp;
			ftmp.str = workingframe[i].str;
			ftmp.fault = pagefaultbool;
			flatframe.push_back(ftmp);
		}
		
	}

	printer("LEAST RECENTLY USED PAGE REPLACEMENT ALGORITHM", flatframe, pagefault);
}

bool search(int key, vector<int>& fr)
{
    for (int i = 0; i < fr.size(); i++)
        if (fr[i] == key)
            return true;
    return false;
}
  
int predict(int pg[], vector<int>& fr, int pn, int index)
{

    int res = -1, farthest = index;
    for (int i = 0; i < fr.size(); i++) {
        int j;
        for (j = index; j < pn; j++) {
            if (fr[i] == pg[j]) {
                if (j > farthest) {
                    farthest = j;
                    res = i;
                }
                break;
            }
        }

        if (j == pn)
            return i;
    }
  

    return (res == -1) ? 0 : res;
}

void simulateOPTIMAL() {

    vector<int> fr;

    int pn,fn;
    
    ifstream ifs;
    ifs.open("MP03 Checker.txt");
    cout<<endl;
    cout<<"OPTIMAL PAGE REPLACEMENT ALGORITHM"<<endl<<endl;
    
    cout<<"Page Replacement Table"<<endl<<endl;
    ifs>>pn;
    int pg[pn];
    for(int i = 0; i<pn; i++){
    	ifs>>pg[i];
	}
	
	ifs>>fn;
    int hit = 0;
    for (int i = 0; i < pn; i++) {
  		
  		

        if (search(pg[i], fr)) {
        	cout <<"page "<<pg[i]<<": "<<endl;
            hit++;
            continue;
        }

        if (fr.size() < fn)
            fr.push_back(pg[i]);
  

        else {
            int j = predict(pg, fr, pn, i + 1);
            fr[j] = pg[i];
        }
        cout <<"page "<<pg[i]<<": ";
        for (int j = 0; j < fr.size(); ++j) {
        	
			cout<<"["<< fr[j] << "]";	
   		 }
   		cout<<endl;
        
    }

    cout<<endl;
    cout << "Display Page Fault:" << pn - hit << endl;
	cout<<endl;
}

void appendOPTIMAL() {
    vector<int> fr;
    int pn,fn;
    
    ifstream ifs;
    ifs.open("MP03 Checker.txt");
    
    ofstream ofs;
    ofs.open("MP03 Checker.txt", ios_base::app);
    ifs>>pn;
    int pg[pn];
    for(int i = 0; i<pn; i++){
    	ifs>>pg[i];
	}
	
	ifs>>fn;
    int hit = 0;
    for (int i = 0; i < pn; i++) {
  		
        if (search(pg[i], fr)) {
        	ofs <<"Page "<<pg[i]<<">> "<<endl;
            hit++;
            continue;
        }
  
        if (fr.size() < fn)
            fr.push_back(pg[i]);

        else {
            int j = predict(pg, fr, pn, i + 1);
            fr[j] = pg[i];
        }
        ofs <<"Page "<<pg[i]<<">> ";
        for (int j = 0; j < fr.size(); ++j) {
        	
			ofs<<"["<< fr[j] << "]";	
   		 }
   		ofs<<endl;
        
    }
    ofs << "Display Page Fault:" << pn - hit << endl;

}


void printer(string algo, deque<framedesc> flatframe, int pagefault)
{
	int topleft = 218;
	string Topleft = "\u250C";
	int topmid = 194;
	string Topmid = "\u252C";
	int topright = 191;
	string Topright = "\u2510";
	int hor = 196;
	string Hor = "\u2500";
	int ver = 179;
	string Ver = "\u2502";
	int midleft = 195;
	string Midleft = "\u251C";
	int midmid = 197;
	string Midmid = "\u253C";
	int midright = 180;
	string Midright = "\u2524";
	int botleft = 192;
	string Botleft = "\u2514";
	int botmid = 193;
	string Botmid = "\u2534";
	int botright = 217;
	string Botright = "\u2518";

	string ou;

	cout<<endl<<algo<<endl<<endl;
	ou = "\n" + algo + "\n\n";

	cout<<"Page Replacement Table"<<endl;
	ou += "Page Replacement Table\n";

	for(int i = 0; i < refsize; i++) {
		cout<<"  "<<ref[i]<<"  ";
		ou += "  "+ ref[i] + "  ";
	}
	cout<<endl;
	ou += "\n";

	for(int i = 0; i < flatframe.size(); i = i + framesize)	{
		if (flatframe[i].fault == true) {
			cout<<" "<<char(topleft)<<char(hor)<<char(topright)<<" ";
			ou += " " + Topleft + Hor + Topright + " ";
		}
		else {
			cout<<"     ";
			ou += "     ";
		}
	}

	cout<<endl;
	ou += "\n";

	int verse = 0;

	for(int i = 0; i < framesize; i++) {

		for(int j = verse; j < flatframe.size(); j = j + framesize) {
			if(flatframe[j].fault == true) {
				cout<<" "<<char(ver)<<flatframe[j].str<<char(ver)<<" ";
				ou += " " + Ver + flatframe[j].str + Ver + " ";
			}
			else {
				cout<<"     ";
				ou += "     ";
			}
		}

		cout<<endl;
		ou += "\n";
		
		if(i != framesize - 1) {
			for(int j = verse; j < flatframe.size(); j = j + framesize) {
				if(flatframe[j].fault == true) {
					cout<<" "<<char(midleft)<<char(hor)<<char(midright)<<" ";
					ou += " " + Midleft + Hor + Midright + " ";
				}
				else {
					cout<<"     ";
					ou += "     ";
				}
			}
		}
		else {
			for(int j = verse; j < flatframe.size(); j = j + framesize) {
				if(flatframe[j].fault == true) {
					cout<<" "<<char(botleft)<<char(hor)<<char(botright)<<" ";
					ou += " " + Botleft + Hor + Botright + " ";
				}
				else {
					cout<<"     ";
					ou += "     ";
				}
			}
		}

		cout<<endl;
		ou += "\n";
		
		verse++;
	}

	cout<<endl<<"Display Page Fault: "<<pagefault<<endl<<endl<<endl;
	ou += "\nDisplay Page Fault: ";
	ss.clear();
	string stmp;
	ss<<pagefault;
	ss>>stmp;
	ou += stmp + "\n\n\n";
	
	o.push_back(ou);
}
