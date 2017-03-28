
PROJECT TITLE: DataTrainer (with GUI)
PURPOSE OF PROJECT:to make various analyses of possible binary splits from numeric records

VERSION or DATE: Started February 27th, 2013 - finished March 5th, 2013


WHAT IS IN THE README:
This readme contains first user instructions and then a pleminary outline from the program's inception.

AUTHOR: Bradley Baker


**Section 1**
USER INSTRUCTIONS: 
Extract the folder DataTrainer from its .zip folder.
The program can now be executed via the .jar file.
Please make sure the data you wish to train from is placed in the DataTrainer folder.
The GUI will provide further instructions for interfacing and use.
NOTE - the @ is used as the return key for input, and all input for interfacing is done through the field at the top of the GUI.


**Section 2**
Program Details

The actual code is further documented in the source - perhaps exhaustively, but I wished all of my movements in the code to be clear
The code was written using the BlueJ IDE, created by the University of Arizona,
and it may thus appear somewhat cluttered when viewed within the limited margins of NotePad or WordPad.

the docs folder contains html files with indexes of methods and constructors 


**Section 3**

***Pleminary Notes and Outline***

 (You may skip this section if you wish, it was more for programmer benefit)
**Warning this section contains early ideas - much has changed**
**please see the source code and docs folder for updated information**

The program requires the following:

"
o Figure out the best binary split on the numeric attribute using GINI

o Figure out the best binary split on the numeric attribute using Entropy & 
Information Gain

o Figure out the best binary split on the numeric attribute using Gain Ratio
" 

*The information below is the initial brainstorming for the program's outline*
*Some features are retained, some are not*
*The list of methods, fields, and constructors is also different*
*NOTE - the multi-dimensional ArrayList approach was used, the other approach was scrapped early-on*

Multi-Dimensional ArrayList Approach:
    
The program will first create a two-dimensional ArrayList matrix, which has K rows and N columns,
    
where K is the number of attributes where N is the number of data records given. This size will 
    
NOT be initially determined, but will grow, hence the use of the ArrayList object rather than the built-in Arrays.
    
The initial ArrayList object will be formatted as follows:
        
an ArrayList of size K, which contains K Arraylists, each of size N. 
        
Individual correlations will be drawn between corresponding indices, that is, attributes which are 
        
correlated will have the same 'column' index, despite having a different 'row' index. 
        
It is assumed, then, that there are no empty spaces, or that empty spaces may be defaulted to a certain value.
        
The values will be sorted using a sorting algorithm of my choice...
    
   
The row containing the numeric value, then, will be accessed via a method which creates a new, one-dimensional
   
ArrayList for each of the possible split-points. 
   
Based on this new ArrayList, another method will parse through all possible binary splits, evaluating their 
   
usefulness via three methods which perform the calculations (by counting and doing some arithmetic which I still
   
have to chalk out). For each split, the split's name will be stored in a string, along with the values for each of
   
its sums. These values will later appear in a GUI.
   
Finally, the program will compare each of the analyses for the splits, and will evaluate them based on their individual
   
criterion. It will then display which ones are the best, by boldening them or something (in a GUI, possibly). 
   


Somewhat-More-Object-Oriented Approach:
    
This approach uses only one-dimensional ArrayLists. It parses through the text file and stores the values in a
    
single ArrayList of size N, where N is the total number of records. Now, as the parsing and storing is being done,
    
we aren't using ArrayList<int>, but rather, ArrayList<attr>, where attr is an object containing the following attributes:
    
numeric value and class label. The numeric value will, of course, be a double, while the class label will be a boolean
    
value (true for + and false for -). The objects will be arranged in the ArrayList based on their numeric value. 
    
Then, the process more or less carries out the same, of course with modifications to deal with the Objects, rather than
    
just values. 
 


Methods, Fields, and Constructors (for MDA approach)
    
private ArrayList cols; //this is the initial arraylist
    
private ArrayList analyses; //this is the ArrayList containing all of the Analyses
                                
			    //it will have three dimensions, one for each Analysis, applied to each split
    
private File file;
    

public DataTestOrEquivalentProgramName(file File) {}
        
//this will deal with the parsing through the file and the creation of the MDA. It will not sum. It will not create the splits.
    
public ArrayList<ArrayList> splits(ArrayList<ArrayList> a) {}
        
//this creates and returns the ArrayList containing all of the possible split points
!!!!

public double getGiniIndex(int i) {}
        //this returns the GiniIndex...
!!!!

public double getGiniSplit(int i) {}
//!!!!

public double getEntropy(int i) {}
        //self explanatory
!!!!public double getInfoGain(int i) {}
        //yeah
!!!!
public void printAnalysis(int i) {}
       //prints the Analyses and Best split based on the Analyses
    

public void stickToArray() {}
       //sticks the analyses into the analysis ArrayList corresponding to the splits ArrayList
    

public String getBesties() {}
       //this will go through all of the Analyses and find the best 
   "..." 

!!! GUI CODE !!! 
 //scrapped early on - no need for GUI - file output is satisfactory

public static void main(String [] args) {}
       //executes the program:
            
//below are steps for the main
1. get file (through GUI?)
            
2. instantiate constructor (parses through file, assigns values to a MDA.)
            
3. uses the new instantiated ArrayList to create the splits ArrayList
            
4. and now, a loop in which we parse through the splits ArrayList, getting the GiniIndex, calculating
                
the GiniSplit, Entropy, and Infogain for a split (at the index in the splits ArrayList). The loop
                
calculates these values and sticks them to the analyses ArrayList. It doesn't print them yet. 
            
5. the printAnalyses method prints out the analyses for each split. This is a separate method, because
                
we need to use both Arrays in our printing.
            
6. getBesties searches through the analyses ArrayList to find out what Analyses work best.
            
7. the best values are printed, and stored in a separate array for future use
            
8. the program ends


//I've decided that the more Object Oriented approach, that is, the one in which I create Record objects, which have

//the attributes we want to look at, would become too convoluted for the purpose of my program.