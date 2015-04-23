<%@ taglib uri="/bbNG" prefix="bbNG"%>
<%@ page isErrorPage="true" %>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/xml2json.js"></script>
<script type="text/javascript" src="../js/jsrender.js"></script>
<script type="text/javascript">
	$.noConflict();
	
	(function($) {
		
		$(function() {

			var url = 'https://learn-content.wsu.edu/Menu.asmx/ContentIncludes';
			var jxhr = $.ajax(url, {
				data: {
					courseId: '<%= request.getParameter("course_id") %>'
				}
			});

			jxhr.done(function(xml) {
				var data = $.xml2json(xml);
				data = data.ContentItem ? data.ContentItem : [{
					title: "Error: Unable to load includes.",
					url: ""
				}];
				data = Array.isArray(data)
					? data
					: [data];
				
				data.unshift({title: "Select an Option", url: ""});
				
				var template = $.templates("#theTmpl");
		
				var htmlOutput = template.render(data);
		
				$("#includeFiles").html(htmlOutput);
				
				$("#includeFiles").change(function() {
					var $el = $(this);
					$("#data-url").val($el.val());
				});
				
			});

			jxhr.fail(function(xhr, statusText) {
				
			});
			
		});
	}(jQuery));
</script>
<style>
	form#mashupForm input,
	form#mashupForm select {
		display: block;
		width: 400px;
	}
</style>
<bbNG:genericPage>

<script id="theTmpl" type="text/x-jsrender">
<option value='{{:url}}?courseId=@X@course.id@X@'>{{:title}}</option>
</script>

<h1>Course ID: <%= request.getParameter("course_id") %></h1>
<bbNG:dataCollection>
<bbNG:step title="Choose Content to Include">
<form id="mashupForm" action="mashup_proc.jsp" method="POST">
<!-- <textarea rows="25" cols="50" name="embedHtml"></textarea>-->
Placeholder Text:
<input type="text" name="title" value="This content will only display when Edit Mode is turned OFF. Do not delete this placeholder text."/>
Include File:
<select id="includeFiles" name="includeFile">
	<!-- <option value="">Select an Option</option>
	<option value="https://learn-contentdev.wsu.edu/includes/absolutePath.html">Absolute Path</option>
	<option value="https://learn-contentdev.wsu.edu/includes/allQuestionExamInstructions.html">All Question Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/assignmentInstructions.html">Assignment Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/discussionInstructions.html">Discussion Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/downloadAcrobat.html">Download Acrobat</option>
	<option value="https://learn-contentdev.wsu.edu/includes/downloadGreenAarow.html">Download Green Aarow</option>
	<option value="https://learn-contentdev.wsu.edu/includes/downloadPdf.html">Download PDF</option>
	<option value="https://learn-contentdev.wsu.edu/includes/fontSizes.html">Font Sizes</option>
	<option value="https://learn-contentdev.wsu.edu/includes/internalMail.html">Internal Mail</option>
	<option value="https://learn-contentdev.wsu.edu/includes/janetHillerFooter.html">Janet Hiller Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/janetHillerFooterBasic.html">Janet Hiller Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/lauriSherfeyFooter.html">Lauri Sherfey Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/lauriSherfeyFooterBasic.html">Lauri Sherfey Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/nancyMacduffFooter.html">Nancy Macduff Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/nancyMacduffFooterBasic.html">Nancy Macduff Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/oneQuestionExamInstructions.html">One Question Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/print.html">Print</option>
	<option value="https://learn-contentdev.wsu.edu/includes/proctoredExamInstructions.html">Proctored Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/readSpeakerPlayButton.html">ReadSpeaker Play Button</option>
	<option value="https://learn-contentdev.wsu.edu/includes/readSpeakerPlayButton_test.html">ReadSpeaker Play BUtton - Test</option>
	<option value="https://learn-contentdev.wsu.edu/includes/specialNoteAssignment.html">Special Note Assignment</option>
	<option value="https://learn-contentdev.wsu.edu/includes/specialNoteDiscussion.html">Special Note Discussion</option>
	<option value="https://learn-contentdev.wsu.edu/includes/specialNoteGetStarted.html">Special Note Get Started</option>
	<option value="https://learn-contentdev.wsu.edu/includes/startHere.html">Start Here</option>


	<option value="https://learn-contentdev.wsu.edu/includes/profed/allQuestionExamInstructions.html">profed/All Question Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/assignmentInstructions.html">profed/Assignment Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/discussionInstructions.html">profed/Discussion Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/HowToAccessAssessments.html">profed/How To Access Assessments</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/HowToAccessYourCourseGrades.html">profed/How To Access Your Course Grades</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/internalMail.html">profed/Internal Mail</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/janetHillerFooter.html">profed/Janet Hiller Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/janetHillerFooterBasic.html">profed/Janet Hiller Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/lauriSherfeyFooter.html">profed/Lauri Sherfey Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/lauriSherfeyFooterBasic.html">profed/Lauri Sherfey Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/nancyMacduffFooter.html">profed/Nancy Macduff Footer</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/nancyMacduffFooterBasic.html">profed/Nancy Macduff Footer Basic</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/oneQuestionExamInstructions.html">profed/One Question Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/proctoredExamInstructions.html">profed/Proctored Exam Instructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/specialNoteAssignment.html">profed/Special Note Assignment</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/specialNoteDiscussion.html">profed/Special Note Discussion</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/specialNoteGetStarted.html">profed/Special Note Get Started</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/startHere.html">profed/Start Here</option>
	<option value="https://learn-contentdev.wsu.edu/includes/profed/startHereFormatted.html">profed/Start Here Formatted</option>

	<option value="https://learn-contentdev.wsu.edu/includes/noncredit/howToSubmitAssignments.html">noncredit/How To Submit Assignments</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/allQuestionExamInstructions.html">credit/allQuestionExamInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/assignmentInstructions.html">credit/assignmentInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/assignmentInstructionsOLD.html">credit/assignmentInstructionsOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/course_evaluation.html">credit/course_evaluation</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/CourseInformationFiles.html">credit/CourseInformationFiles</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/discussionInstructions.html">credit/discussionInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/eTutoring.html">credit/eTutoring</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/eTutoringOLD.html">credit/eTutoringOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/GetConnected.html">credit/GetConnected</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/GetConnected_BlakeTest.html">credit/GetConnected_BlakeTest</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/GetConnectedOLD.html">credit/GetConnectedOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/groupDiscussionInstructions.html">credit/groupDiscussionInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HomePageRightNav.html">credit/HomePageRightNav</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToAccesseTutoring.html">credit/HowToAccesseTutoring</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToAngelCourseGrades.html">credit/HowToAngelCourseGrades</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToAssessments.html">credit/HowToAssessments</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToCaveat.html">credit/HowToCaveat</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToCourseEmail.html">credit/HowToCourseEmail</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToFindArticle.html">credit/HowToFindArticle</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToFindArticleOLD.html">credit/HowToFindArticleOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToMediaCenter.html">credit/HowToMediaCenter</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToProctoredExams.html">credit/HowToProctoredExams</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToProctoredExamsOLD.html">credit/HowToProctoredExamsOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToProctorWSUExams.html">credit/HowToProctorWSUExams</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/howtoreducefilesize.html">credit/howtoreducefilesize</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToWSULibraries.html">credit/HowToWSULibraries</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/HowToWSULibrariesOLD.html">credit/HowToWSULibrariesOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/InstructorContactNote.html">credit/InstructorContactNote</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/InstructorInformation.html">credit/InstructorInformation</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/InstructorInformationOLD.html">credit/InstructorInformationOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/internalMail.html">credit/internalMail</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/MediaCenterLesson.html">credit/MediaCenterLesson</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/MediaContact.html">credit/MediaContact</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/medialesson.html">credit/medialesson</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/MediaOnline.html">credit/MediaOnline</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/MoreInformation.html">credit/MoreInformation</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/MoreInformationOLD.html">credit/MoreInformationOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/oneQuestionExamInstructions.html">credit/oneQuestionExamInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/Policies.html">credit/Policies</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/proctoredExamInstructions.html">credit/proctoredExamInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/ProctoredOnlineExams.html">credit/ProctoredOnlineExams</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/ProctoredPaperExams.html">credit/ProctoredPaperExams</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/Resources.html">credit/Resources</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/specialCourseInformation.html">credit/specialCourseInformation</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/specialNoteGetStarted.html">credit/specialNoteGetStarted</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/specialNoteGetStarted_v2.html">credit/specialNoteGetStarted_v2</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/specialNoteGetStartedOLD.html">credit/specialNoteGetStartedOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/specialNoteLesson.html">credit/specialNoteLesson</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/startHere.html">credit/startHere</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/startHereFormatted.html">credit/startHereFormatted</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus.html">credit/syllabus</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/tech_support.html">credit/tech_support</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/tech_supportOLD.html">credit/tech_supportOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/tech_supportOLD2.html">credit/tech_supportOLD2</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/TESTcd.html">credit/TESTcd</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/TESTMoreInformation.html">credit/TESTMoreInformation</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/tipsForSuccess.html">credit/tipsForSuccess</option>
	
	<option value="https://learn-contentdev.wsu.edu/includes/credit/campus/pul/syllabus.html">credit/campus/pul/syllabus</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/campus/pul/tech_support.html">credit/campus/pul/tech_support</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/campus/van/syllabus.html">credit/campus/van/syllabus</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/campus/van/tech_support.html">credit/campus/van/tech_support</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/ddls/contact.html">credit/ddls/contact</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/ddls/overview.html">credit/ddls/overview</option>




	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/acctg/proctorU.html">credit/dept/acctg/proctorU</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/blended/doYouKnow.html">credit/dept/blended/doYouKnow</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/blended/orientation.html">credit/dept/blended/orientation</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/business/course_eval_instructions.html">credit/dept/business/course_eval_instructions</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/com/ePortfolio.html">credit/dept/com/ePortfolio</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/crmj/academicDishonesty.html">credit/dept/crmj/academicDishonesty</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/crmj/courseEvaluations.html">credit/dept/crmj/courseEvaluations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/crmj/incompleteGradePolicy.html">credit/dept/crmj/incompleteGradePolicy</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/eTutoring.html">credit/dept/emba/eTutoring</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/HowToSubmitAssignments.html">credit/dept/emba/HowToSubmitAssignments</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/letsgetstarted.html">credit/dept/emba/letsgetstarted</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/syllabus.html">credit/dept/emba/syllabus</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/syllabus/academicRegulations.html">credit/dept/emba/syllabus/academicRegulations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/syllabus/disabilityAccomodations.html">credit/dept/emba/syllabus/disabilityAccomodations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/syllabus/eTutoring.html">credit/dept/emba/syllabus/eTutoring</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/emba/syllabus/librarySupport.html">credit/dept/emba/syllabus/librarySupport</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/academic-integrity.html">credit/dept/embanet/academic-integrity</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/academic-regulations.html">credit/dept/embanet/academic-regulations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/capstone-project.html">credit/dept/embanet/capstone-project</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/disability-accomodations.html">credit/dept/embanet/disability-accomodations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/Do_not_delete_these_includes.html">credit/dept/embanet/Do_not_delete_these_includes</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/incomplete-policy.html">credit/dept/embanet/incomplete-policy</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/letter-grade.html">credit/dept/embanet/letter-grade</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/library-support.html">credit/dept/embanet/library-support</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/online-collaboration.html">credit/dept/embanet/online-collaboration</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/reading_quiz.html">credit/dept/embanet/reading_quiz</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/return_to_default.html">credit/dept/embanet/return_to_default</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/student-services.html">credit/dept/embanet/student-services</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/embanet/technical-support.html">credit/dept/embanet/technical-support</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/hd/WritingStatement.html">credit/dept/hd/WritingStatement</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/mis/FinalGrades.html">credit/dept/mis/FinalGrades</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/mis/Standards.html">credit/dept/mis/Standards</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/omba/addDropWithdrawl.html">credit/dept/omba/addDropWithdrawl</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/omba/mbaOath.html">credit/dept/omba/mbaOath</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/omba/OMBA_essence.html">credit/dept/omba/OMBA_essence</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/omba/OMBA_essenceOLD.html">credit/dept/omba/OMBA_essenceOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/dept/omba/syllabus.html">credit/dept/omba/syllabus</option>

	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/academicCalendar.html">credit/syllabus/academicCalendar</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/academicIntegrity.html">credit/syllabus/academicIntegrity</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/academicRegulations.html">credit/syllabus/academicRegulations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/CampusSafety.html">credit/syllabus/CampusSafety</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/CampusSafetyOLD.html">credit/syllabus/CampusSafetyOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/CCESyllabusInstructions.html">credit/syllabus/CCESyllabusInstructions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/courseSchedule.html">credit/syllabus/courseSchedule</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/criticalThinking.html">credit/syllabus/criticalThinking</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/ddpStudentHandbook.html">credit/syllabus/ddpStudentHandbook</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/disabilityaccomodations.html">credit/syllabus/disabilityaccomodations</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/disabilityaccomodationsOLD.html">credit/syllabus/disabilityaccomodationsOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/disabilityaccomodationsOLD2.html">credit/syllabus/disabilityaccomodationsOLD2</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/extensions.html">credit/syllabus/extensions</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/incompletePolicy.html">credit/syllabus/incompletePolicy</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/librarySupport.html">credit/syllabus/librarySupport</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/librarySupportOLD.html">credit/syllabus/librarySupportOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/Midterm_grade_policy_A_F.html">credit/syllabus/Midterm_grade_policy_A_F</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/Midterm_grade_policy_C_F.html">credit/syllabus/Midterm_grade_policy_C_F</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/navbar.html">credit/syllabus/navbar</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/onlineCollaboration.html">credit/syllabus/onlineCollaboration</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/onlineCollaborationOLD.html">credit/syllabus/onlineCollaborationOLD</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/onlineWritingLab.html">credit/syllabus/onlineWritingLab</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/RegionalCampusStudents.html">credit/syllabus/RegionalCampusStudents</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/scsTechnicalSupport.html">credit/syllabus/scsTechnicalSupport</option>
	<option value="https://learn-contentdev.wsu.edu/includes/credit/syllabus/StudentPrivacy.html">credit/syllabus/StudentPrivacy</option>-->



</select>
<input id="data-url" type="hidden" name="data-url"/>
</bbNG:step>
<bbNG:stepSubmit>
<bbNG:stepSubmitButton label="Submit"/>
</bbNG:stepSubmit>
</bbNG:dataCollection>
</form>
</bbNG:genericPage>