CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo ListExamples.java Submitted
    cp student-submission/ListExamples.java grading-area
    cp TestListExamples.java grading-area
else
    echo ListExamples.java NOT Submitted
    exit 1
fi

javac -cp $CPATH grading-area/*.java

if [[ $? -eq 0 ]]
then
    echo Succesful Compilation
else
    echo "file couldn't compile 0/4"
    exit 1
fi

java -cp $CPATH org.junit.runner.JunitCore TestListExamples > junit-output.txt

#FAILURES = 'grep'

#if [[ $FAILURES -eq 0 ]]
#then
#    echo All Tests Passed
#    echo '4/4'
#else

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
