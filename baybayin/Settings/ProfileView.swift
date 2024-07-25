//
//  ProfileView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/26/24.
//

import SwiftUI

struct Profile: Hashable {
    var id = UUID().uuidString
    var name: String
}


struct ProfileView: View {
    @State private var isSettingsViewPresented = false
    private var profile = Profile(name: "Sean Velasco")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Section(header: Text("Statistics").font(.headline)) {
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 16) {
                                Label("Streak", systemImage: "sun.max.fill")
                                    .bold()
                                    .foregroundColor(.orange)
                                Text("201")
                                    .font(.title)
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(.separator, lineWidth: 1)
                            )
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Label("XP", systemImage: "bolt.fill")
                                    .bold()
                                    .foregroundColor(.yellow)
                                Text("24326")
                                    .font(.title)
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(.separator, lineWidth: 1)
                            )
                        }
                    }
                    .headerProminence(.increased)
                    Section(header: Text("Achievements").font(.headline)) {
                        VStack {
                            Text("Coming soon!")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.center)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(.separator, lineWidth: 1)
                        )

                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(AppColor.background)
            .navigationTitle(profile.name)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(AppColor.background, for: .navigationBar)
            .toolbar {
                ToolbarItem {
                    Button(action: { isSettingsViewPresented = true }) {
                        Image(systemName: "gearshape")
                    }
                    .foregroundColor(.white)
                    .sheet(isPresented: $isSettingsViewPresented) {
                        SettingsView()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
