---
layout: page
title: STAT 486/586
subtitle: Introduction to Statistical Computing
---

This page is intended to help TAs when constructing Canvas quizzes. 


## Canvas quiz construction

We are still using the "old Canvas quizzes" (I believe). 

## Implementation timing

I would like the Canvas quiz implemented one week before the homework is due. 
Of course, this is dependent on the instructor giving the TA adequate time to
make this happen (which does not always occur). 
So please just let the instructor know if implementation one week ahead of the 
due date is not possible and let him know when implementation will be complete. 

## Check answer key

While the instructor attempts to be as accurate as possible in the 
construction of the answer key, 
he is only human and therefore fallible. 
Thus, please take a look at the answer key to ensure you agree with the answers.
A great way to check the answers is to complete the assignment without the key
first. 
Then check your answers versus my answers. 
In the past, I have found that it is just as likely that the TA is correct as
the instructor. 

Let the instructor know of any discrepancies so these can get resolved as soon
as possible (ideally) before you start implementing the Canvas quiz.


## Create Canvas quiz

When you are reading to starting implementing the quiz, 
either 1) click on Assignments and "+" if the assignment needs to be created or
2) click on the assignment name if the instructor already created the assignment. 

If creating the assignment yourself, change the Type to "Quiz", name the 
assignment, and add the due date (if known). 
Then click on "Save". 

Now you should be able to click on the assignment name in the "Assignments" 
area of the Canvas course. 
To start editing the assignment, click on "Edit". 



## Adding external files

All assignments will be provided as pdf files. 
Many assignments will have associated data files. 

These should be added into the "Quiz instructions" by clicking on the icon 
that allows you to "Upload Documents". 
Just put each data file on its own line named according to the file name.
When uploading these documents, please put them in the "assignments" folder. 

Otherwise, no other instructions are provided. 

Adding assignment keys, i.e. solutions, is discussed below. 




## Canvas quiz options

Unless otherwise notified, Canvas quizzes will allow unlimited attempts with
students being able to see which answers are incorrect and the highest score
counting toward the score. 
Thus please make sure the following settings are set

- [ ] Allow Multiple Attempts
- [ ] Let Students See Their Quiz Responses (Incorrect Questions Will Be Marked in Student Feedback)
- [ ] Let Students See The Correct Answers
- [ ] Show Correct Answers at <after due date>

Often, we will want the answers to be randomly sorted and thus we will the 
following setting selected

- [ ] Shuffle Answers





## Adding questions

To begin adding questions, click on the "Questions" tab. 
Then click on "+ New Question". 
The other two choices: "+ New Question Group" and "Find Questions" are not
generally used by this instructor. 

It is easiest (in my experience) to add questions sequentially starting from
the beginning of the assignment. 
This eliminates the need later to rearrange questions. 

When constructing a question, the box left of the question type is shown
to the instructor and TA for the course and NOT to students. 
Thus, I generaly don't use this. 

In the **Question:** area, please include the question number using the same
formatting used in the pdf, e.g. 1.(a). 



## Question types

All questions should be implemented as one of the following

- Text (no question)
- Numeric answer
- Multiple choice
- Multiple answer


### Text (no question)

Many questions on assignments will start with a preamble and then a series
of questions all related to that preamble. 
Use the "Text (no question)" type to add that preamble and saying something 
like the following "For the following questions, ...".


### Numeric answer

Numeric answers should allow a reasonable range of values to allow for the 
possibility of rounding errors.
Typically this will be ~4% of the actual answer. 

Please make sure to remove automatic answers that have a default correct value
of 0.

Sometimes answers aren't immediately numeric answers but can be quickly 
converted to numeric answers.
For example, confidence intervals are really just two numeric answers.
In the Canvas quiz, just use the same number, e.g. 3.(b) and indicate 
"confidence interval lower bound" and "confidence interval upper bound".

### Multiple choice

For questions with a single correct, non-numeric answer the type should be set
to multiple choice. 
The correct answer is provided in the answer key. 
As a TA, you will need to come up with the incorrect answers.
Generally, this will involve thinking about common conceptual mistakes and 
including answers that correspond to these conceptual mistakes. 

Sometimes there are a set of questions all with the same answers. 
In these cases, just use the same answers for all of these questions. 

### Multiple answer

For questions with multiple correct, non-numeric answers the type should be set
to multiple answer. 
These will be used sparingly and the instructor will try to provide suggestions 
for what the answers should be. 

## Double-check Canvas answers

After


## Assignment keys

The 
[Canvas system is extremely easy to hack](https://community.canvaslms.com/t5/Canvas-Question-Forum/Think-your-Course-Files-are-safe-Think-again/td-p/211576)
because the security employed by
Canvas developers is to reference each file by a number and this number is 
sequential across the university. 
Thus, any student in the course can attempt to find all documents for a course
that they have Canvas access to by simply adding 1 to this number and seeing 
if the document exists. 
Repeating this process, the students can find all files for the course 
including "hidden" files. 

Apparently the way to create security is to 
"[Schedule student availability])(https://community.canvaslms.com/t5/Instructor-Guide/How-do-I-restrict-files-and-folders-to-students-in-Canvas/ta-p/610"
for the file. 
The only way I know to do this is to 1) upload the file, 2) select the file,
and 3) click on the cloud with a lock to "Manage access". 
Then "Schedule Availability" to start after the assignment is due. 
Let's set it for 1 day later. 

A link to this key can be included in the "Quiz Instructions". 
It should not let the students have access to the key until the file release
date-time. 


## Instructor will publish

When the Canvas quiz has been implemented and files have been uploaded. 
Let the instructor know and he will take one last look over everything and 
publish the Canvas quiz when everything looks good, .
