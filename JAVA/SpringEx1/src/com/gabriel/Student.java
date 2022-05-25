package com.gabriel;  
  
public class Student {  
private String name;
private String date;
private String directory;
private String username;
  
public String getName() {  
    return name;  
}  
  
public void setName(String name) {  
    this.name = name;  
} 

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getDirectory() {
	return directory;
}

public void setDirectory(String directory) {
	this.directory = directory;
}  

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}
  
public void displayInfo(){  
    System.out.println("Hello: "+name);  
    System.out.println("Date and Time: "+date);
    System.out.println("Current Directory: "+directory);
    System.out.println("User Name: "+username);
}


} 