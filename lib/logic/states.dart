 abstract class InitialState{}
 class LoadedState extends InitialState{}
 class NewsBottomBarState extends InitialState{}
 class NewsInitialState extends InitialState{}

 class NewsGetBusinessLoadingState extends InitialState{}
 class NewsGetBusinessSuccessState extends InitialState{}
 class NewsBusinessErrorState extends InitialState{
   late final String error;

   NewsBusinessErrorState({required this.error});
 }

 class NewsGetSportsLoadingState extends InitialState{}
 class NewsGetSportsSuccessState extends InitialState{}

 class ChangeBottomNavBarState extends InitialState{}

 class NewsSportsErrorState extends InitialState{
   late final String error;

   NewsSportsErrorState({required this.error});
 }


 class NewsGetScienceLoadingState extends InitialState{}
 class NewsGetScienceSuccessState extends InitialState{}
 class NewsScienceErrorState extends InitialState{
   late final String error;


   NewsScienceErrorState({required this.error});
 }

 class NewsGetSearchLoadingState extends InitialState{}
 class NewsGetSearchSuccessState extends InitialState{}
 class NewsSearchErrorState extends InitialState{
   late final String error;


   NewsSearchErrorState({required this.error});
 }