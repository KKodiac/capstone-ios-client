//
//  NavigationConfigurator.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/13.
//
/* How to Create Custom NavBar -> Deprecated */

//import SwiftUI
//
//struct NavigationBarModifier: ViewModifier {
//    var foregroundColor: UIColor?
//    var backgroundColor: UIColor?
//    
//    init(foregroundColor: UIColor?, backgroundColor: UIColor?) {
//        self.backgroundColor = backgroundColor
//        self.foregroundColor = foregroundColor
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithTransparentBackground()
//        coloredAppearance.backgroundColor = .clear
//        coloredAppearance.titleTextAttributes = [.foregroundColor: foregroundColor ?? UIColor.white]
//        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor ?? UIColor.white]
//        
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//        UINavigationBar.appearance().tintColor = .white
//
//    }
//    
//    func body(content: Content) -> some View {
//        ZStack{
//            content
//            VStack {
//                GeometryReader { geometry in
//                    Color(self.backgroundColor ?? .clear)
//                        .frame(height: geometry.safeAreaInsets.top)
//                        .edgesIgnoringSafeArea(.top)
//                }
//            }
//        }
//    }
//}
