//
//  TabBar.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var tabItems: TabItems
    let padding: CGFloat = 5
    let iconSize: CGFloat = 20
    var iconFrame: CGFloat {
        (padding * 2) + iconSize
    }
    var tabItemCount: CGFloat {
        CGFloat(tabItems.items.count)
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Bar(tabItems: tabItems,
                    firstCenter: getFirstCenter(geo),
                    stepperToNextCenter: getStepperToNextCenter(geo))
                    .foregroundColor(Color.solid)
                    .frame(width: geo.size.width, height: 50)
                    .background(
                        VStack {
                            Color.clear
                            Color.solid.ignoresSafeArea()
                        }
                    )
                
                
                HStack(spacing: getSpacing(geo)) {
                    ForEach(0..<tabItems.items.count, id: \.self) { i in
                        ZStack {
                            Image(systemName: tabItems.items[i].imageName)
                                .resizable()
                                .foregroundColor(getIconColor(i))
                                .frame(width: iconSize, height: iconSize)
                                .padding(.all, padding)
                                .background(Color.solid)
                                .clipShape(Circle())
                               
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(Animation.easeInOut) {
                                tabItems.select(i)
                            }
                        }
                        .offset(y: self.tabItems.items[i].offset)
                    }
                }
                .ignoresSafeArea()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 50)
    }
    
    private func getSpacing(_ geo: GeometryProxy) -> CGFloat {
        (geo.size.width - (iconFrame * tabItemCount)) / (tabItemCount + 1)
    }
    
    private func getFirstCenter(_ geo: GeometryProxy) -> CGFloat {
        getSpacing(geo) + iconFrame/2
    }
    
    private func getStepperToNextCenter(_ geo: GeometryProxy) -> CGFloat {
        getSpacing(geo) + iconFrame
    }
    
    private func getIconColor(_ i: Int) -> Color {
        if tabItems.selectedTabIndex - 1.0 == CGFloat(i) {
            return Color(tabItems.items[i].color)
        } else {
            return Color.gray
        }
    }
}
