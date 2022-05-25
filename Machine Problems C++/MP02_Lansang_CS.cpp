#include <iostream>
#include <string> 
#include <iomanip>
#include <sstream>
#include <vector>
#include <fstream>
#include<algorithm>
using namespace std;

struct Process{
	int copyburst_time;
	int arrival_time;	int turnaround_time;	
	int waiting_time;
	int priority;
	int burstTime;
	string identifier;
	string copyIdentifier;
};


struct node{
    char pname;
    int btime;
    int atime;
    int priority;
    int restime=0;
    int ctime=0;
    int wtime=0;
}a[1000],b[1000],c[1000];


void displayProcesses(vector<Process> processes, int numProcess);
void printGantChart();
void printTable(vector<Process> processes, int numProcess,int burstTotal, int arrival_timeTotal, int priorityTotal, int waiting_timeTotal, int turnaround_timeTotal, double burstAverage, double arrival_timeAverage, double priorityAverage, double waiting_timeAverage, double turnaround_timeAverage);
void append();
void appendProcesses(vector<Process> processes, int numProcess);
void appendGantChart();
void appendTable(vector<Process> processes, int numProcess, int burstTotal, int arrival_timeTotal, int priorityTotal, int waiting_timeTotal, int turnaround_timeTotal, double burstAverage, double arrival_timeAverage, double priorityAverage, double waiting_timeAverage, double turnaround_timeAverage);
void nonPre();

string firstLine = ""; 
string secondLine = ""; 
string thirdLine = "";
string fifthLine = ""; 

char one = 196; 
char two = 179;
char Three = 218; 
char Four = 191; 
char Five = 192; 
char Six = 217; 
char Seven = 194;
char Eight = 193; 
char Nine = 180; 
char Ten = 195; 
char Eleven = 197; 

ifstream checker;

bool btimeSort(node a,node b){
    return a.btime < b.btime; 
}
bool atimeSort(node a,node b){
    return a.atime < b.atime; 
}
bool prioritySort(node a,node b){
    return a.priority < b.priority; 
}
int k=0,f=0,r=0;

void Preemptive(int nop,int qt){
    int n=nop,q;
    sort(a,a+n,atimeSort);
    int ttime=0,i;
    int j,tArray[n];
    int alltime=0;
    bool moveLast=false;
    for(i=0;i<n;i++){
        alltime+=a[i].btime;
    }
    alltime+=a[0].atime;
    for(i=0;ttime<=alltime;){
        j=i;
        while(a[j].atime<=ttime&&j!=n){
            b[r]=a[j];
            j++;
            r++;
        }
        if(r==f){
            c[k].pname='i';
            c[k].btime=a[j].atime-ttime;
            c[k].atime=ttime;
            ttime+=c[k].btime;
            k++;
            continue;
        }
        i=j;
        if(moveLast==true){
            sort(b+f,b+r,prioritySort);
             b[r]=b[f];
             f++;
             r++;
        }
        j=f;
        if(b[j].btime>qt){
            c[k]=b[j];
            c[k].btime=qt;
            k++;
            b[j].btime=b[j].btime-qt;
            ttime+=qt;  
            moveLast=true;
            for(q=0;q<n;q++){
                if(b[j].pname!=a[q].pname){
                    a[q].wtime+=qt;
                }
            }
        }
        else{
            c[k]=b[j];
            k++;
            f++;
            ttime+=b[j].btime;  
            moveLast=false;
            for(q=0;q<n;q++){
                if(b[j].pname!=a[q].pname){
                    a[q].wtime+=b[j].btime;
                }
            }
        }
        if(f==r&&i>=n)
        break;
    }
    tArray[i]=ttime;
    ttime+=a[i].btime;
    for(i=0;i<k-1;i++){
        if(c[i].pname==c[i+1].pname){
            c[i].btime+=c[i+1].btime;
            for(j=i+1;j<k-1;j++)
                c[j]=c[j+1];
            k--;
            i--;
        }
    }
    
    int rtime=0;
    for(j=0;j<n;j++){
        rtime=0;
        for(i=0;i<k;i++){
            if(c[i].pname==a[j].pname){
                a[j].restime=rtime;
                break;
            }
            rtime+=c[i].btime;
        }
    }
    float averageWaitingTime=0;
    float averageResponseTime=0;
    float averageTAT=0;
    
    cout<<"\nGantt Chart\n";
    rtime=0;
    for (i=0; i<k; i++){
        if(i!=k)
            cout<<"|  "<<'P'<< c[i].pname << "   "; 
        rtime+=c[i].btime;
        for(j=0;j<n;j++){
            if(a[j].pname==c[i].pname)
                a[j].ctime=rtime;
        } 
    }
    cout<<"\n";
    rtime=0;
    for (i=0; i<k+1; i++){
        cout << rtime << "\t";
        tArray[i]=rtime;
        rtime+=c[i].btime; 
    }
    cout<<"\n";
    cout<<"\n";
    cout<<"P.Name Priority AT\tBT\tCT\tTAT\tWT\tRT\n";
    for (i=0; i<nop&&a[i].pname!='i'; i++){
        if(a[i].pname=='\0')
            break;
        cout <<'P'<< a[i].pname << "\t"; 
        cout << a[i].priority << "\t";
        cout << a[i].atime << "\t";
        cout << a[i].btime << "\t";
        cout << a[i].ctime << "\t"; 
        cout << a[i].wtime+a[i].ctime-rtime+a[i].btime << "\t"; 
        averageTAT+=a[i].wtime+a[i].ctime-rtime+a[i].btime;
        cout << a[i].wtime+a[i].ctime-rtime << "\t"; 
        averageWaitingTime+=a[i].wtime+a[i].ctime-rtime;
        cout << a[i].restime-a[i].atime << "\t";  
        averageResponseTime+=a[i].restime-a[i].atime;
        cout <<"\n"; 
    }
    cout<<"Average Response time: "<<(float)averageResponseTime/(float)n<<endl;
    cout<<"Average Waiting time: "<<(float)averageWaitingTime/(float)n<<endl;
    cout<<"Average TA time: "<<(float)averageTAT/(float)n<<endl;
}



void appendPreemptive(int nop,int qt){
	ofstream ofs;
	ofs.open("MP02 Checker.txt",ofstream::app );
    int n=nop,q;
    sort(a,a+n,atimeSort);
    int ttime=0,i;
    int j,tArray[n];
    int alltime=0;
    bool moveLast=false;
    for(i=0;i<n;i++){
        alltime+=a[i].btime;
    }
    alltime+=a[0].atime;
    for(i=0;ttime<=alltime;){
        j=i;
        while(a[j].atime<=ttime&&j!=n){
            b[r]=a[j];
            j++;
            r++;
        }
        if(r==f){
            c[k].pname='i';
            c[k].btime=a[j].atime-ttime;
            c[k].atime=ttime;
            ttime+=c[k].btime;
            k++;
            continue;
        }
        i=j;
        if(moveLast==true){
            sort(b+f,b+r,prioritySort);
            // b[r]=b[f];
            // f++;
            // r++;
        }
        j=f;
        if(b[j].btime>qt){
            c[k]=b[j];
            c[k].btime=qt;
            k++;
            b[j].btime=b[j].btime-qt;
            ttime+=qt;  
            moveLast=true;
            for(q=0;q<n;q++){
                if(b[j].pname!=a[q].pname){
                    a[q].wtime+=qt;
                }
            }
        }
        else{
            c[k]=b[j];
            k++;
            f++;
            ttime+=b[j].btime;  
            moveLast=false;
            for(q=0;q<n;q++){
                if(b[j].pname!=a[q].pname){
                    a[q].wtime+=b[j].btime;
                }
            }
        }
        if(f==r&&i>=n)
        break;
    }
    tArray[i]=ttime;
    ttime+=a[i].btime;
    for(i=0;i<k-1;i++){
        if(c[i].pname==c[i+1].pname){
            c[i].btime+=c[i+1].btime;
            for(j=i+1;j<k-1;j++)
                c[j]=c[j+1];
            k--;
            i--;
        }
    }
    
    int rtime=0;
    for(j=0;j<n;j++){
        rtime=0;
        for(i=0;i<k;i++){
            if(c[i].pname==a[j].pname){
                a[j].restime=rtime;
                break;
            }
            rtime+=c[i].btime;
        }
    }
    float averageWaitingTime=0;
    float averageResponseTime=0;
    float averageTAT=0;
    
    ofs<<"\nGantt Chart\n";
    rtime=0;
    for (i=0; i<k; i++){
        if(i!=k)
            ofs<<"|  "<<'P'<< c[i].pname << "   "; 
        rtime+=c[i].btime;
        for(j=0;j<n;j++){
            if(a[j].pname==c[i].pname)
                a[j].ctime=rtime;
        } 
    }
    ofs<<"\n";
    rtime=0;
    for (i=0; i<k+1; i++){
        ofs << rtime << "\t";
        tArray[i]=rtime;
        rtime+=c[i].btime; 
    }
    ofs<<"\n";
    ofs<<"\n";
    ofs<<"P.Name Priority AT\tBT\tCT\tTAT\tWT\tRT\n";
    for (i=0; i<nop&&a[i].pname!='i'; i++){
        if(a[i].pname=='\0')
            break;
        ofs <<'P'<< a[i].pname << "\t"; 
        ofs << a[i].priority << "\t";
        ofs << a[i].atime << "\t";
        ofs << a[i].btime << "\t";
        ofs << a[i].ctime << "\t"; 
        ofs << a[i].wtime+a[i].ctime-rtime+a[i].btime << "\t"; 
        averageTAT+=a[i].wtime+a[i].ctime-rtime+a[i].btime;
        ofs << a[i].wtime+a[i].ctime-rtime << "\t"; 
        averageWaitingTime+=a[i].wtime+a[i].ctime-rtime;
        ofs << a[i].restime-a[i].atime << "\t";  
        averageResponseTime+=a[i].restime-a[i].atime;
        ofs <<"\n"; 
    }
    ofs<<"Average Response time: "<<(float)averageResponseTime/(float)n<<endl;
    ofs<<"Average Waiting time: "<<(float)averageWaitingTime/(float)n<<endl;
    ofs<<"Average TA time: "<<(float)averageTAT/(float)n<<endl;
}

int main() {

	bool tryAgain = true;
	string answer; 
	int nop;
	do {
		
    	//ins
    	ifstream ifs;
		ifs.open("MP02 Checker.txt");
		
    	ifs>>nop;
    	cout << "Programmed by: Cristan Kim Xavier S. Lansang" << endl;
		cout<<"MP02 - PRIORITY Preemptive and Non-Preemptive \n\n";
		
    	cout<< "Program Reading input file..."<<endl;
		cout<<"input file: 'MP02 Checker.txt'"<<endl<<endl;
		
    	cout<<"Enter No. of processes: "<<nop<<endl;
    	cout<<"PRIORITY PREEMPTIVE"<<endl;
    	int i;
	    int atime[nop];
	    int btime[nop];
	    int prio[nop];
	    cout<<"Arrival Time: "<<endl;
	    for(i=0;i<nop;i++){
	    	
	    	ifs>>atime[i];
	    	cout<<"P"<<(i+1)<<":"<<atime[i];
	    	cout<<endl;
	    }
	    cout<<endl;
	    cout<<"Burst Time: "<<endl;
	     for(i=0;i<nop;i++){
	    	ifs>>btime[i];
	    	cout<<"P"<<(i+1)<<":"<<btime[i];
	    	cout<<endl;
	    }
	    cout<<endl;
	    cout<<"Priority: "<<endl;
	     for(i=0;i<nop;i++){
	    	ifs>>prio[i];
	    	cout<<"P"<<(i+1)<<":"<<prio[i];
	    	cout<<endl;
	    }
	    cout<<endl;
	    for(i=0;i<nop;i++){
	    	
	        a[i].pname = (i+1) + '0';
	        a[i].priority = prio[i];
	        a[i].atime = atime[i];
	        a[i].btime = btime[i];
	        a[i].wtime=-a[i].atime+1;
	    }
    	//
    	Preemptive(nop,1);
    	cout<<endl<<endl;
		cout<<"PRIORITY NON-PREEMPTIVE"<<endl;
		nonPre();
	do {
		cout << "\nDo you want to run again? [y/n]?: ";
		cin >> answer;
		
		if(answer == "N" || answer == "n"){
			int nop;
			tryAgain = false;
			
			ifstream ifs;
			ifs.open("MP02 Checker.txt");
			ofstream ofs;
			ofs.open("MP02 Checker.txt", ofstream::app);
	    	ifs>>nop;
	    	ofs << "Programmed by:" << endl;
			ofs<<"MP02 - PRIORITY Preemptive and Non-Preemptive \n\n";
			
	    	ofs<< "Program Reading"<<endl;
			ofs<<"input file..."<<endl;
			ofs<<"input file: 'MP02 Checker.txt'"<<endl;
			
	    	ofs<<"Enter No. of processes"<<nop<<endl;
			ofs<<endl;
	    	ofs<<"PRIORITY PREEMPTIVE"<<endl;
	    	int i;
		    int atime[nop];
		    int btime[nop];
		    int prio[nop];
		    ofs<<"Arrival Time: "<<endl;
		    for(i=0;i<nop;i++){
		    	
		    	ifs>>atime[i];
		    	ofs<<"P"<<(i+1)<<":"<<atime[i];
		    	ofs<<endl;
		    }
		    ofs<<endl;
		    ofs<<"Burst Time: "<<endl;
		     for(i=0;i<nop;i++){
		    	ifs>>btime[i];
		    	ofs<<"P"<<(i+1)<<":"<<btime[i];
		    	ofs<<endl;
		    }
		    ofs<<endl;
		    ofs<<"Priority: "<<endl;
		     for(i=0;i<nop;i++){
		    	ifs>>prio[i];
		    	ofs<<"P"<<(i+1)<<":"<<prio[i];
		    	ofs<<endl;
		    }
		    ofs<<endl;
		    for(i=0;i<nop;i++){
		    	
		        a[i].pname = (i+1) + '0';
		        a[i].priority = prio[i];
		        a[i].atime = atime[i];
		        a[i].btime = btime[i];
		        a[i].wtime=-a[i].atime+1;
		    }
	    	//
	    	appendPreemptive(nop,1);
			
			
			append();
		}
			
	} while(answer != "N" && answer != "n" && answer != "y" && answer != "Y");
	
		
	} while(tryAgain);
	return 0;
}

void nonPre(){
	int sumBurstTime = 0;
		int numProcess;
		int queueAlgorithms[3];
		int quantumTimes[3];
		string tempStringHolder;
		string tempStringHolder2;
		stringstream ss;
		
		
			 checker.open("MP02 Checker.txt");
		
		cout<<endl;
		
		checker >> numProcess;
		vector<Process> processes(numProcess);
		
		
		try{
			for (int i = 0; i < numProcess; i++) {
				checker >> processes[i].arrival_time;
				if(processes[i].arrival_time < 0)
					throw processes[i].arrival_time;
			}
			
			for (int i=0; i< numProcess; i++) {
				checker >> processes[i].burstTime;
				if( processes[i].burstTime < 0)
					throw processes[i].burstTime;
			}
			
			for (int i=0; i< numProcess; i++){
				checker >> processes[i].priority;
				if(processes[i].priority < 0)
					throw processes[i].priority;
			}
		}
		
		catch(int e){
			cout << endl << "Something went wrong with the input process please try again " << endl;
			system("cls");
		}
		
	
		displayProcesses(processes, numProcess);
		
		for(int i = 0; i < numProcess; i++) {
			ss << (i+1);
			processes[i].identifier = "P";
			processes[i].identifier +=  ss.str();
			processes[i].copyIdentifier = processes[i].identifier;
			sumBurstTime += processes[i].burstTime;
			processes[i].turnaround_time == 0;
			ss.str("");
		}
		
	
		for(int i = 0; i < numProcess; i++) {
			for(int j = 0; j < numProcess-1; j++) {
				if(processes[j+1].arrival_time < processes[j].arrival_time) {
					int numHolder = processes[j].arrival_time;
					processes[j].arrival_time = processes[j+1].arrival_time;
					processes[j+1].arrival_time = numHolder;
					
					int burstHolder = processes[j].burstTime;
					processes[j].burstTime = processes[j+1].burstTime;
					processes[j+1].burstTime = burstHolder;
					
					string stringHolder = processes[j].identifier;
					processes[j].identifier = processes[j+1].identifier;
					processes[j+1].identifier = stringHolder;
					
					int priorityHolder = processes[j].priority;
					processes[j].priority = processes[j+1].priority;
					processes[j+1].priority = priorityHolder;
				}
			}
		}
		
		for(int i = 0; i < numProcess; i++) 
			processes[i].copyburst_time = processes[i].burstTime;
		
		vector<Process> firstQueueVector;
		
		for(int i = 0; i < numProcess; i++)
			firstQueueVector.push_back(processes[i]);

		int currentProcess=0;
		int runtime = 0;
		bool notZeroes = true;
		bool arrival_timeNotReached = true;
		
		bool firstTime;
		bool firstTimeQueue = true;
		
		while(firstQueueVector.size() > 0 && notZeroes && arrival_timeNotReached) {
			int currentProcessTime;
			arrival_timeNotReached = false;
			bool preempted;
			notZeroes = false;
	
			for(int i = 0; i < firstQueueVector.size(); i++) { 
				if(firstQueueVector[i].copyburst_time > 0)
					notZeroes = true;
			}
			
					for(int i=0;i<firstQueueVector.size();i++)
					{
						if((firstQueueVector[i].priority < firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time) || (firstQueueVector[i].priority == firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time && firstQueueVector[i].arrival_time <= firstQueueVector[currentProcess].arrival_time && firstQueueVector[i].identifier != firstQueueVector[currentProcess].identifier))
						{
							currentProcess = i;
						}
					}
					
					firstLine+=Seven;
					secondLine+=two;
					secondLine+=firstQueueVector[currentProcess].identifier;	
					thirdLine+=Eleven;
					ss << runtime;
					fifthLine+=ss.str();	
					tempStringHolder = firstQueueVector[currentProcess].identifier;
					for(int i=0;i<tempStringHolder.length();i++)
					{
						firstLine+=one;
						thirdLine+=one;
					}
					tempStringHolder2 = ss.str();
					if(firstTimeQueue)
					{
						firstTimeQueue = false;
					}
					
					for(int i=0;i<tempStringHolder.length()-(tempStringHolder2.length()-1);i++)
					{
						fifthLine+=" ";
					}
					ss.str("");
					tempStringHolder = "";
					tempStringHolder2 = "";
					preempted = false;
					while(!preempted)
					{
						preempted = false;
						runtime++;
						firstQueueVector[currentProcess].copyburst_time--;
						firstLine+=one;
						secondLine+=" ";
						thirdLine+=one;
						fifthLine+=" ";
						if(firstQueueVector[currentProcess].copyburst_time == 0)
						{
							for(int i =0;i<numProcess;i++)
							{
								if(processes[i].identifier == firstQueueVector[currentProcess].identifier)
								{
									processes[i].turnaround_time = runtime - firstQueueVector[currentProcess].arrival_time;
									firstQueueVector.erase(firstQueueVector.begin() + currentProcess);
									firstTime = false;
									break;
								}
							}
							if(currentProcess>=firstQueueVector.size() && firstQueueVector.size()>0)
							{
								currentProcess--;
							}
							for(int i =0;i<firstQueueVector.size();i++)
							{
								if(runtime >= firstQueueVector[i].arrival_time)
								{
									arrival_timeNotReached = true;
								}
							}
							preempted = true;
						}
					
					}
					if(firstQueueVector.size()>0)
					{
						for(int i=0;i<firstQueueVector.size();i++)
						{
							if(firstQueueVector[i].priority < firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time)
							{
								if(firstTime)
								{
									firstQueueVector.push_back(firstQueueVector[currentProcess]);
									firstQueueVector.erase(firstQueueVector.begin() + currentProcess);
									firstTime = false;
								}	
								preempted = true;
								arrival_timeNotReached = true;
								if(i > currentProcess)
								{
									currentProcess = i-1;
									i--;
								}
								else
								{
									currentProcess=i;
								}
								break;
							}
						}
					}
	notZeroes = false;
				
		for(int i = 0; i < firstQueueVector.size(); i++) {
			if(firstQueueVector[i].copyburst_time > 0)
				notZeroes = true;
		}
				
		if(!arrival_timeNotReached) {
			for(int i = 0; i < firstQueueVector.size(); i++)
				firstQueueVector.push_back(firstQueueVector[i]);
		}
				
		if(currentProcess >= firstQueueVector.size())
			currentProcess=0;
					
		if(firstQueueVector.size() == 0) {
			ss << runtime; 
			firstLine += Four;
			secondLine += two;	
			thirdLine += Six;
			fifthLine += ss.str();
			ss.str("");
		}
	}
		
	currentProcess = 0;
	

	printGantChart();
		

	int turnaround_timeTotal = 0;
	for(int i = 0; i < numProcess; i++)
		turnaround_timeTotal += processes[i].turnaround_time;
		
	double turnaround_timeAverage = turnaround_timeTotal / (numProcess * 1.00);
	for(int i = 0; i < numProcess; i++)
		processes[i].waiting_time = processes[i].turnaround_time - processes[i].burstTime;
	
	int waiting_timeTotal = 0;
	for(int i = 0; i < numProcess; i++)
		waiting_timeTotal += processes[i].waiting_time;
		
	double waiting_timeAverage = waiting_timeTotal / (numProcess * 1.00);
	int burstTotal = 0;
	int arrival_timeTotal = 0;
	int priorityTotal = 0;
	
	for(int i = 0; i < numProcess; i++) {
		burstTotal += processes[i].burstTime;
		arrival_timeTotal = processes[i].arrival_time;
		priorityTotal = processes[i].priority;
	}
	

	double burstAverage = burstTotal / (numProcess * 1.00);
	double arrival_timeAverage = arrival_timeTotal / (numProcess * 1.00);
	double priorityAverage = priorityTotal / (numProcess * 1.00);

	printTable(processes, numProcess,burstTotal, arrival_timeTotal, priorityTotal, waiting_timeTotal, turnaround_timeTotal, burstAverage, arrival_timeAverage, priorityAverage, waiting_timeAverage, turnaround_timeAverage);
	

	firstLine = "";
	secondLine = "";
	thirdLine = "";
	fifthLine = "";
	
	processes.clear();
}
void append(){
	int sumBurstTime = 0;
		int numProcess;
		int queueAlgorithms[3];
		int quantumTimes[3];
		string tempStringHolder;
		string tempStringHolder2;
		stringstream ss;
		ifstream checker;
		ofstream ofs;
		ofs.open("MP02 Checker.txt", ofstream::app);
		checker.open("MP02 Checker.txt");
		
	

		checker >> numProcess;
		vector<Process> processes(numProcess);
		
	
		try{
			for (int i = 0; i < numProcess; i++) {
				checker >> processes[i].arrival_time;
				if(processes[i].arrival_time < 0)
					throw processes[i].arrival_time;
			}
			
			for (int i=0; i< numProcess; i++) {
				checker >> processes[i].burstTime;
				if( processes[i].burstTime < 0)
					throw processes[i].burstTime;
			}
			
			for (int i=0; i< numProcess; i++){
				checker >> processes[i].priority;
				if(processes[i].priority < 0)
					throw processes[i].priority;
			}
		}
		
		catch(int e){
			cout << endl << "Something went wrong with the input process please try again " << endl;
			system("cls");
		}
		
	
		appendProcesses(processes, numProcess);
		
		for(int i = 0; i < numProcess; i++) {
			ss << (i+1);
			processes[i].identifier = "P";
			processes[i].identifier +=  ss.str();
			processes[i].copyIdentifier = processes[i].identifier;
			sumBurstTime += processes[i].burstTime;
			processes[i].turnaround_time == 0;
			ss.str("");
		}
		
	
		for(int i = 0; i < numProcess; i++) {
			for(int j = 0; j < numProcess-1; j++) {
				if(processes[j+1].arrival_time < processes[j].arrival_time) {
					int numHolder = processes[j].arrival_time;
					processes[j].arrival_time = processes[j+1].arrival_time;
					processes[j+1].arrival_time = numHolder;
					
					int burstHolder = processes[j].burstTime;
					processes[j].burstTime = processes[j+1].burstTime;
					processes[j+1].burstTime = burstHolder;
					
					string stringHolder = processes[j].identifier;
					processes[j].identifier = processes[j+1].identifier;
					processes[j+1].identifier = stringHolder;
					
					int priorityHolder = processes[j].priority;
					processes[j].priority = processes[j+1].priority;
					processes[j+1].priority = priorityHolder;
				}
			}
		}
		
		for(int i = 0; i < numProcess; i++) 
			processes[i].copyburst_time = processes[i].burstTime;
		
		vector<Process> firstQueueVector;
		
		for(int i = 0; i < numProcess; i++)
			firstQueueVector.push_back(processes[i]);

		int currentProcess=0;
		int runtime = 0;
		bool notZeroes = true;
		bool arrival_timeNotReached = true;
		
		bool firstTime;
		bool firstTimeQueue = true;
		
		while(firstQueueVector.size() > 0 && notZeroes && arrival_timeNotReached) {
			int currentProcessTime;
			arrival_timeNotReached = false;
			bool preempted;
			notZeroes = false;
	
			for(int i = 0; i < firstQueueVector.size(); i++) { 
				if(firstQueueVector[i].copyburst_time > 0)
					notZeroes = true;
			}
			
					for(int i=0;i<firstQueueVector.size();i++)
					{
						if((firstQueueVector[i].priority < firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time) || (firstQueueVector[i].priority == firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time && firstQueueVector[i].arrival_time <= firstQueueVector[currentProcess].arrival_time && firstQueueVector[i].identifier != firstQueueVector[currentProcess].identifier))
						{
							currentProcess = i;
						}
					}
					
					firstLine+=" ";
					secondLine+="|";
					secondLine+=firstQueueVector[currentProcess].identifier;	
					thirdLine+=" ";
					ss << runtime;
					fifthLine+=ss.str();	
					tempStringHolder = firstQueueVector[currentProcess].identifier;
					for(int i=0;i<tempStringHolder.length();i++)
					{
						firstLine+="-";
						thirdLine+="-";
					}
					tempStringHolder2 = ss.str();
					if(firstTimeQueue)
					{
						firstTimeQueue = false;
					}
					
					for(int i=0;i<tempStringHolder.length()-(tempStringHolder2.length()-1);i++)
					{
						fifthLine+=" ";
					}
					ss.str("");
					tempStringHolder = "";
					tempStringHolder2 = "";
					preempted = false;
					while(!preempted)
					{
						preempted = false;
						runtime++;
						firstQueueVector[currentProcess].copyburst_time--;
						firstLine+="-";
						secondLine+=" ";
						thirdLine+="-";
						fifthLine+=" ";
						if(firstQueueVector[currentProcess].copyburst_time == 0)
						{
							for(int i =0;i<numProcess;i++)
							{
								if(processes[i].identifier == firstQueueVector[currentProcess].identifier)
								{
									processes[i].turnaround_time = runtime - firstQueueVector[currentProcess].arrival_time;
									firstQueueVector.erase(firstQueueVector.begin() + currentProcess);
									firstTime = false;
									break;
								}
							}
							if(currentProcess>=firstQueueVector.size() && firstQueueVector.size()>0)
							{
								currentProcess--;
							}
							for(int i =0;i<firstQueueVector.size();i++)
							{
								if(runtime >= firstQueueVector[i].arrival_time)
								{
									arrival_timeNotReached = true;
								}
							}
							preempted = true;
						}
					
					}
					if(firstQueueVector.size()>0)
					{
						for(int i=0;i<firstQueueVector.size();i++)
						{
							if(firstQueueVector[i].priority < firstQueueVector[currentProcess].priority && runtime >= firstQueueVector[i].arrival_time)
							{
								if(firstTime)
								{
									firstQueueVector.push_back(firstQueueVector[currentProcess]);
									firstQueueVector.erase(firstQueueVector.begin() + currentProcess);
									firstTime = false;
								}	
								preempted = true;
								arrival_timeNotReached = true;
								if(i > currentProcess)
								{
									currentProcess = i-1;
									i--;
								}
								else
								{
									currentProcess=i;
								}
								break;
							}
						}
					}
	notZeroes = false;
				
		for(int i = 0; i < firstQueueVector.size(); i++) {
			if(firstQueueVector[i].copyburst_time > 0)
				notZeroes = true;
		}
				
		if(!arrival_timeNotReached) {
			for(int i = 0; i < firstQueueVector.size(); i++)
				firstQueueVector.push_back(firstQueueVector[i]);
		}
				
		if(currentProcess >= firstQueueVector.size())
			currentProcess=0;
					
		if(firstQueueVector.size() == 0) {
			ss << runtime; 
			firstLine += " ";
			secondLine += "|";	
			thirdLine += " ";
			fifthLine += ss.str();
			ss.str("");
		}
	}
		
	currentProcess = 0;
	

	appendGantChart();
		

	int turnaround_timeTotal = 0;
	for(int i = 0; i < numProcess; i++)
		turnaround_timeTotal += processes[i].turnaround_time;
		
	double turnaround_timeAverage = turnaround_timeTotal / (numProcess * 1.00);
	for(int i = 0; i < numProcess; i++)
		processes[i].waiting_time = processes[i].turnaround_time - processes[i].burstTime;
	
	int waiting_timeTotal = 0;
	for(int i = 0; i < numProcess; i++)
		waiting_timeTotal += processes[i].waiting_time;
		
	double waiting_timeAverage = waiting_timeTotal / (numProcess * 1.00);
	int burstTotal = 0;
	int arrival_timeTotal = 0;
	int priorityTotal = 0;
	
	for(int i = 0; i < numProcess; i++) {
		burstTotal += processes[i].burstTime;
		arrival_timeTotal = processes[i].arrival_time;
		priorityTotal = processes[i].priority;
	}
	

	double burstAverage = burstTotal / (numProcess * 1.00);
	double arrival_timeAverage = arrival_timeTotal / (numProcess * 1.00);
	double priorityAverage = priorityTotal / (numProcess * 1.00);

	appendTable(processes, numProcess,burstTotal, arrival_timeTotal, priorityTotal, waiting_timeTotal, turnaround_timeTotal, burstAverage, arrival_timeAverage, priorityAverage, waiting_timeAverage, turnaround_timeAverage);
	

	firstLine = "";
	secondLine = "";
	thirdLine = "";
	fifthLine = "";
	
	processes.clear();
	string answer;
}
void displayProcesses(vector<Process> processes, int numProcess) {
	cout << "\nArrival Time:" << endl;
	for(int i = 0; i < numProcess; i++)
		cout << "P" << i+1 << ":" << processes[i].arrival_time << endl;
		
	cout << "\nBurst Time:" << endl;
	for(int i = 0; i < numProcess; i++)
		cout << "P" << i+1 << ":" << processes[i].burstTime << endl;
	
	cout << "\nPriority Number:" << endl;
	for(int i = 0; i < numProcess; i++)
		cout << "P" << i+1 << ":" << processes[i].priority << endl;
}

void appendProcesses(vector<Process> processes, int numProcess) {
	ofstream ofs;
	ofs.open("MP02 Checker.txt", ofstream::app);

	ofs << "\nArrival Time:" << endl;
	for(int i = 0; i < numProcess; i++)
		ofs << "P" << i+1 << ":" << processes[i].arrival_time << endl;
		
	ofs << "\nBurst Time:" << endl;
	for(int i = 0; i < numProcess; i++)
		ofs << "P" << i+1 << ":" << processes[i].burstTime << endl;
	
	ofs << "\nPriority Number:" << endl;
	for(int i = 0; i < numProcess; i++)
		ofs << "P" << i+1 << ":" << processes[i].priority << endl;
}


void printGantChart(){
	
	cout << endl
	     << "Gantt Chart" << endl
	     << firstLine << endl
	     << secondLine << endl
	     << thirdLine << endl
	     << fifthLine << endl;
}

void appendGantChart(){
	ofstream ofs;
	ofs.open("MP02 Checker.txt", ofstream::app);
	ofs << endl
	     << "Gantt Chart" << endl
	     << firstLine << endl
	     << secondLine << endl
	     << thirdLine << endl
	     << fifthLine << endl;
}


void printTable(vector<Process> processes, int numProcess, int burstTotal, int arrival_timeTotal, int priorityTotal, int waiting_timeTotal, int turnaround_timeTotal, double burstAverage, double arrival_timeAverage, double priorityAverage, double waiting_timeAverage, double turnaround_timeAverage) {
	cout << "\nTable" << endl;
	

	cout << Three;
	for (int i = 0; i < 41; i++) {
	    if (i == 8 || i == 25 || i == 41)
	    	cout << Seven;
		else 
			cout << one;
	}
	cout << Four << endl;
	
	
	cout << two << " Process" << two << "Turn Around Time" << two << "  Waiting Time " << two << endl;
	for (int i = 0; i < 40; i++ ) {
	    if (i == 8 || i == 24)
	        cout << Eleven;
	    if (i == 0)
	        cout << Ten;
	    if (i == 39)
	        cout << Nine;
	    else 
	        cout << one;
	}
	cout << endl;
	

	for(int i = 0; i < numProcess; i++) {
		cout << "|" << "  ";
		cout << " " << processes[i].identifier << "\t " << two << "    \t" << processes[i].turnaround_time << "\t  " << two << " \t " << processes[i].waiting_time << "\t  " << two << endl;
		
		for (int i = 0; i < 40; i++ ) {
	        if (i == 8 || i == 24)
	            cout << Eleven;
	        if (i == 0)
	            cout << Ten;
	        if (i == 39)
		        cout << Nine;
	        else 
	            cout << one;
	    }
	    cout << endl;
	}
	

	cout << two << " " << "Total" << "\t " << two << "   \t" << turnaround_timeTotal << "\t  " << two << " \t " << waiting_timeTotal << "\t  " << two << endl;
	cout << fixed << setprecision(2);
    for (int i = 0; i < 40; i++ ) {
       	if (i == 8 || i == 24)
            cout << Eleven;
        if (i == 0)
           	cout << Ten;
        if (i == 39)
            cout << Nine;
        else 
            cout << one;
    }
    cout << endl;
    

	cout << two << "Average" << " " << two << "   \t" << turnaround_timeAverage << "\t  " << two << " \t " << waiting_timeAverage << "\t  " << two << endl;
	

	cout << Five;
	for (int i = 0; i < 41; i++ ) {
	    if (i == 8 || i == 25 ||i == 41)
	    	cout << Eight;
		else 
			cout << one;	
	}
	cout << Six << endl;
}

void appendTable(vector<Process> processes, int numProcess, int burstTotal, int arrival_timeTotal, int priorityTotal, int waiting_timeTotal, int turnaround_timeTotal, double burstAverage, double arrival_timeAverage, double priorityAverage, double waiting_timeAverage, double turnaround_timeAverage){
	ofstream ofs;
	ofs.open("MP02 Checker.txt", ofstream::app);
	ofs << "\nTable" << endl;
	

	ofs << " ";
	for (int i = 0; i < 41; i++) {
	    if (i == 8 || i == 25 || i == 41)
	    	ofs << " ";
		else 
			ofs << "-";
	}
	ofs << " " << endl;
	
	
	ofs << "|" << " Process" << "|" << "Turn Around Time" << "|" << "  Waiting Time " << "|" << endl;
	for (int i = 0; i < 40; i++ ) {
	    if (i == 8 || i == 24)
	        ofs << " ";
	    if (i == 0)
	        ofs << " ";
	    if (i == 39)
	        ofs << " ";
	    else 
	        ofs << "-";
	}
	ofs << endl;
	

	for(int i = 0; i < numProcess; i++) {
		ofs << "|"<< "  ";
		ofs << " " << processes[i].identifier << "\t " << "|" << "    \t" << processes[i].turnaround_time << "\t  " << "|" << " \t " << processes[i].waiting_time << "\t  " << "|" << endl;
		
		for (int i = 0; i < 40; i++ ) {
	        if (i == 8 || i == 24)
	            ofs << " ";
	        if (i == 0)
	            ofs << " ";
	        if (i == 39)
		        ofs << " ";
	        else 
	            ofs << "-";
	    }
	    ofs << endl;
	}
	

	ofs << "|" << " " << "Total" << "\t " << "|" << "   \t" << turnaround_timeTotal << "\t  " << "|" << " \t " << waiting_timeTotal << "\t  " << "|" << endl;
	ofs << fixed << setprecision(2);
    for (int i = 0; i < 40; i++ ) {
       	if (i == 8 || i == 24)
            ofs << " ";
        if (i == 0)
           	ofs << " ";
        if (i == 39)
            ofs << " ";
        else 
            ofs << "-";
    }
    ofs << endl;
    

	ofs << "|" << "Average" << " " << "|" << "   \t" << turnaround_timeAverage << "\t  " << "|" << " \t " << waiting_timeAverage << "\t  " << "|" << endl;
	

	ofs << " ";
	for (int i = 0; i < 41; i++ ) {
	    if (i == 8 || i == 25 ||i == 41)
	    	ofs << " ";
		else 
			ofs << "-";	
	}
	ofs << " " << endl;
}
