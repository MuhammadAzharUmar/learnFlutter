import 'package:flutter/material.dart';
import 'package:portfolio/Utlities/colors.dart';
import 'package:portfolio/View/Home/Widgets/circular_skills_widget.dart';
import 'package:portfolio/View/Home/Widgets/linear_language_skills_widget.dart';
import 'package:portfolio/View/Home/Widgets/personal_details.dart';

class PersonalCV extends StatelessWidget {
  const PersonalCV({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      padding: const EdgeInsets.all(10),
      color: kbgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 0.0,
                  ),
                ], color: kbg2Color, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * .075,
                      height: MediaQuery.of(context).size.width * .075,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .0375),
                          image: const DecorationImage(
                              image: AssetImage('assets/azhar.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const Spacer(),
                    const Text(
                      "Muhammad Azhar",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Satisfy',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: kfgColor),
                    ),
                    const Text(
                      "Software Engineer & Flutter Developer wordpress and javascripte learner",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: kGreyColor,
                          fontFamily: 'Satisfy',
                          fontWeight: FontWeight.w300),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Divider(
              color: kbg3Color,
            ),
            const PersonalDetails(
              textt: 'Residense',
              value: 'Pakistan',
            ),
            const PersonalDetails(
              textt: 'City',
              value: 'Sargodha',
            ),
            const PersonalDetails(
              textt: 'Age',
              value: '23',
            ),
            const Divider(
              color: kbg3Color,
            ),
            const Text(
              "Skills",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kfgColor),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularSkillsWidget(
                  title: 'Dart',
                  value: .85,
                ),
                CircularSkillsWidget(
                  title: 'Flutter',
                  value: .70,
                ),
                CircularSkillsWidget(
                  title: 'Firebase',
                  value: .65,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Coding",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kfgColor),
            ),
            const SizedBox(
              height: 20,
            ),
            const LinearCodingSkillsWidget(
              value: .95,
              title: 'Dart',
            ),
            const LinearCodingSkillsWidget(
              value: .80,
              title: 'Java',
            ),
            const LinearCodingSkillsWidget(
              value: .60,
              title: 'C/C++',
            ),
            const LinearCodingSkillsWidget(
              value: .60,
              title: 'Python',
            ),
            const LinearCodingSkillsWidget(
              value: .85,
              title: 'HTML',
            ),
            const LinearCodingSkillsWidget(
              value: .75,
              title: 'CSS',
            ),
            const LinearCodingSkillsWidget(
              value: .70,
              title: 'Tailwind',
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
