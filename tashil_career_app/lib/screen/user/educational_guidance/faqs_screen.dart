

import 'package:counselling/constants.dart';
import 'package:flutter/material.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: buttonColor,
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text("1. What is the best way to choose a college or university?",
            style: TextStyle(
              fontFamily: fontFamilySemiBold,
              fontSize: 16,
            ),),
            Text("- Consider factors such as academic programs, campus facilities, location, size, cost, financial aid options, and student support services. Visit campuses if possible, and talk to current students and alumni.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("2. How can I decide on a major?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
            Text("- Assess your interests, strengths, and career goals. Take introductory courses in various fields, seek advice from academic advisors, and consider job market trends and opportunities.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("3. What are the different types of financial aid available?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Financial aid options include scholarships, grants, work-study programs, and student loans. Research federal, state, and institutional aid, as well as private scholarships.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("4. How do I apply for scholarships?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Start by researching scholarships early, meet all application deadlines, and prepare necessary documents like transcripts, recommendation letters, and personal essays. Use scholarship search engines and consult your school's financial aid office.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("5. What are some effective study habits?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Effective study habits include setting a regular study schedule, breaking down material into manageable sections, using active learning techniques (e.g., summarizing, questioning, teaching others), and taking regular breaks.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),

            SizedBox(height: 30,),
            Text("High School to College Transition",
              style: TextStyle(
                fontFamily: fontFamilyBold,
                fontSize: 18,
              ),),
            SizedBox(height: 15,),
            Text("6. What should I do to prepare for college applications?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Maintain good grades, participate in extracurricular activities, build relationships with teachers for recommendations, research potential colleges, prepare for standardized tests, and start drafting your personal statement early.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("7. How important are standardized test scores in college admissions?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- The importance varies by institution. Some colleges place significant weight on standardized test scores, while others have adopted test-optional policies. Research the requirements of each college you’re interested in.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),

            Text("8. What is the role of extracurricular activities in college applications?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Extracurricular activities showcase your interests, skills, leadership qualities, and commitment. Quality is more important than quantity; colleges look for depth and sustained involvement.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 30,),
            Text("Higher Education and Career Guidance",
              style: TextStyle(
                fontFamily: fontFamilyBold,
                fontSize: 18,
              ),),
            SizedBox(height: 15,),
            Text("9. How do I balance school and work?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Create a realistic schedule that prioritizes your responsibilities, communicate with your employers about your academic commitments, utilize campus resources, and practice good time management.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("10. What should I include in my resume for internships or jobs?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Include your contact information, education, relevant coursework, work experience, skills, and extracurricular activities. Tailor your resume to the specific position you are applying for.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("11. How can I improve my chances of getting an internship?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Network with professionals in your field, attend career fairs, apply early, tailor your resume and cover letter, and prepare thoroughly for interviews.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("12. What resources are available for career planning and job search?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Utilize your school's career services, attend workshops and career fairs, join professional organizations, use online job search platforms, and seek mentorship from professionals in your desired field.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 30,),
            Text("Graduate School Guidance",
              style: TextStyle(
                fontFamily: fontFamilyBold,
                fontSize: 18,
              ),),
            SizedBox(height: 15,),
            Text("13. How do I decide if I should go to graduate school?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Evaluate your career goals, the necessity of an advanced degree in your field, your interest in further study, and the financial and time commitments required.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("14. What is the process for applying to graduate school?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Research programs, meet with potential advisors, prepare for and take required standardized tests, gather transcripts and recommendation letters, write a strong personal statement, and submit applications by the deadlines.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 15,),
            Text("15. How do I secure funding for graduate school?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
            Text("- Explore options like fellowships, assistantships, scholarships, grants, and loans. Check with your prospective program for specific funding opportunities.",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
            SizedBox(height: 30,),
            Text("Miscellaneous",
              style: TextStyle(
                fontFamily: fontFamilyBold,
                fontSize: 18,
              ),),
            SizedBox(height: 15,),
            Text("16. How can I make the most of my college experience?",
              style: TextStyle(
                fontFamily: fontFamilySemiBold,
                fontSize: 16,
              ),),
              Text("- Get involved in campus activities, build relationships with professors and peers, seek out internships and research opportunities, and take advantage of campus",
              style: TextStyle(
                fontFamily: fontFamilyRegular,
                fontSize: 16,
              ),),
          ],
        ),
      ),
    );
  }
}
