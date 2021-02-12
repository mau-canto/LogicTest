# LogicTest
 Two logical problems that need to be solved by code. You can solve them using Python, Java, Swift, Kotlin or JavaScript. I decided to use Swift. 

First of all I solved them on my notebook to see the logic behind the problem. Then I began to think about the variables and functins that I could use for the code. I wrote the down in my notebook. After that, I started to code using the playground and built different versions for each problem. Each one of the was like an update to do more things and to get closer to the expected result. Finally, I place the last version of each code in a project using the Command Line Tool on Xcode. It solved everything faster than leaving it on the playground.

Note: to run the code it is preferred to have Xcode installed and run it there. Literally just press the run button and let it do everything. It generates a random input using the ranges from the instructions. I will leave some links to the small videos i made and posted on YouTube of the code running.

Exercise1: https://youtu.be/EfbOEckokjA

Exercise2: https://youtu.be/ee300lpVjK4
 
 ## Exercise 1
 Starting at the top left corner of an N x M grid and facing towards the right, you keep walking one square at a time in the direction you are facing. If you reach the boundary of the grid or if the next square you are about to visit has already been visited, you turn right. You stop when all the squares in the grid have been visited. What direction will you be facing when you stop? For example: Consider the case with N = 3, M = 3. The path followed will be (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2) -> (2,1) -> (2,0) -> (1,0) -> (1,1). At this point, all squares have been visited, and you are facing right.
 
 ### Input specification
 The first line contains T the number of test cases. Each of the next T lines contain two integers N and M, denoting the number of rows and columns respectively.
 
 ### Output specification
 Output T lines, one for each test case, containing the required direction you will be facing at the end. Output L for left, R for right, U for up, and D for down. 1 <= T <= 5000, 1 <= N,M <= 10^9.
 
 ### Input example
 4
 
 1 1
 
 2 2  
 
 3 1  

3 3   

### Output example
 R     
 
 L    
 
 D     
 
 R     
 
 ## Exercise 2
 A well-known software development company has been commissioned by the Archaeological Society. One of the modules has to help the archaeologists to process data about the ruins of buildings they have found during their excavations of ancient cities. Development of this module has been assigned to Vasya.
 
 Vasya, being a seasoned programmer, at once noticed that the module would need a database to contain the descriptions of the ruins and the estimated construction times of the buildings. It would be all fine, but suddenly the manager got the genial idea that since the database describes Roman ruins, the years of construction should be stored in the Roman number system. Now Vasya is wondering how many symbols he needs to set aside for each year number field in the database. According to the functional specification, the software module must be able to handle years from A to B (inclusive). Help Vasya determine the minimal number of characters sufficient for storing any year number in the range from A to B.
 
 ### Input specification
 The only input line contains the descriptions of the years A and B, separated by the "-" sign. A description of a year consists of one to four decimal digits (the number of the year), followed by either "AD" (Anno Domini, the current era) or "BC" (Before Christ, before the current era). In both directions the years are numbered starting from 1. It is known that (753BC) <= A <= B <= (2012AD).
 
 ### Output specification
 The output should consist of a single integer, the minimal number of characters that have to be reserved in the database for the year number.
 
 ### Input example
 1BC-1AD
 
 ### Output example
 7
 
 ### Hint(s)
 For input:
 753BC-747BC
 
 Output must be:
 3
 
 For input:
 2000AD-2012AD
 
 Output must be:
 10

Note:
It is important to remember that the Romans did not use the AD/BC concepts. Instead, they counted the years from the mythical founding of Rome (Anno Urbis Conditae - 753BC).
