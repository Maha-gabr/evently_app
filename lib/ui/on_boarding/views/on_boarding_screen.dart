import 'package:evently_app/ui/on_boarding/model/on_boarding_model.dart';
import 'package:evently_app/ui/on_boarding/shared_prefs.dart';
import 'package:evently_app/ui/on_boarding/views/widgets/lang_item.dart';
import 'package:evently_app/utiles/app_assets.dart';
import 'package:evently_app/utiles/app_routes.dart';
import 'package:flutter/material.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentIndex = 0;

@override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
  pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    //final bool isDark = Provider.of<AppThemeProvider>(context).isDark();
    final List<OnBoardingModel> modelList = OnBoardingModel.getOnBoardingModelList(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title:Image.asset(AppAssets.logoImage),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.04,vertical: 18),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemCount: modelList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Image.asset(modelList[index].imagePath,fit: BoxFit.cover,width: double.infinity,),
                          Text(modelList[index].title,style: Theme.of(context).textTheme.titleLarge,),
                          SizedBox(height: height* 0.01,),
                          Text(modelList[index].description,style: Theme.of(context).textTheme.displaySmall,),
                          LangItem.LangTemeItem(isLangSelector:  true,),
                          SizedBox(height: height * 0.02,),
                          LangItem.LangTemeItem(isThemeSelector: true,),
                          SizedBox(height: height * 0.04,),
                          ElevatedButton(
                              onPressed: () async {
                                if(index <modelList.length -1){
                                  pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                                }else{
                                 await AppPreference.markOnboardingComplete();
                                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.registerScreenRouteName,  (route) =>false,);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary
                              ),
                              child: Text(
                                currentIndex == 0
                                    ? "Next"
                                    : currentIndex == modelList.length - 1
                                    ? "Finish"
                                    : "Continue",
                              ),)
                        ],
                      ),
                    );
                  },),
            ),
          ],
        ),
      ),

    );
  }
}
