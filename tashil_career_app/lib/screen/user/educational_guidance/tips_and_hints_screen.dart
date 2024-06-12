import 'package:counselling/constants.dart';
import 'package:flutter/material.dart';

class TipsAndHintsScreen extends StatefulWidget {
  const TipsAndHintsScreen({super.key});

  @override
  State<TipsAndHintsScreen> createState() => _TipsAndHintsScreenState();
}

class _TipsAndHintsScreenState extends State<TipsAndHintsScreen> {
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
            'Tips and Hints',
            style:
                TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              Text(
                "1. Identify Interests and Strengths:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Assess your interests and strengths through self-reflection, aptitude tests, and discussions with mentors or career counselors.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "2. Set Clear Goals:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Define short-term and long-term educational and career goals. This helps in choosing the right courses and extracurricular activities.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "3. Research Educational Paths:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Explore various educational paths, including traditional degrees, vocational training, online courses, and certifications. Understand the requirements and outcomes of each path.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "5. Develop Effective Study Habits:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Find a study routine that works best for you. Utilize techniques like active reading, summarizing, and spaced repetition. Maintain a consistent study schedule.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "6. Seek Support and Resources:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Use available resources such as tutoring centers, libraries, online forums, and study groups. Don’t hesitate to ask for help from teachers, peers, or mentors.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "7. Stay Organized:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Keep track of assignments, deadlines, and exam dates using planners, calendars, or digital tools. Organize study materials for easy access and review.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "8. Balance Academics and Extracurriculars:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Engage in extracurricular activities that align with your interests and career goals. These can provide practical experience and enhance your resume.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "9. Maintain Well-being:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Take care of your physical and mental health. Ensure you get enough sleep, eat well, exercise regularly, and take breaks to avoid burnout.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "10. Embrace Lifelong Learning:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Stay curious and open to learning beyond formal education. Engage in continuous skill development through reading, workshops, and online courses.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "11. Network and Build Relationships:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Connect with peers, instructors, and professionals in your field of interest. Networking can provide opportunities for mentorship, internships, and job placements.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Text(
                "12. Stay Informed About Trends:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Keep up with trends and changes in your field of interest. This helps in staying relevant and adapting to new challenges and opportunities.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "13. Evaluate Progress Regularly:",
                style: TextStyle(
                  fontFamily: fontFamilySemiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                "- Regularly assess your progress towards your goals. Reflect on what’s working well and what needs adjustment. Be flexible and willing to modify your plan as needed.",
                style: TextStyle(
                  fontFamily: fontFamilyRegular,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ])));
  }
}
