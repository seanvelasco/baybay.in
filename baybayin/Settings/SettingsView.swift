//
//  SettingsView.swift
//  baybayin
//
//  Created by Sean Velasco on 6/26/24.
//

struct Profile: Hashable {
    var id = UUID().uuidString
    var name: String
}

import SwiftUI

struct SettingsView: View {
    private var profile = Profile(name: "Sean Velaco")
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Group {
                        Section(header: Text("Account").font(.headline)) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Preferences")
                            }
                            NavigationLink(destination: EmptyView()) {
                                Text("Profile")
                            }
                            NavigationLink(destination: EmptyView()) {
                                Text("Notifications")
                            }
                            NavigationLink(destination: EmptyView()) {
                                Text("Social accounts")
                            }
                        }
                        .headerProminence(.increased)
                        
                        Section(header: Text("Support").font(.headline)) {
                            NavigationLink(destination: EmptyView()) {
                                Text("Help center")
                            }
                        }
                        .headerProminence(.increased)
                        Button(action: {}) {
                            Text("Logout")
                                .foregroundColor(.red)
//                                .textCase(.uppercase)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        Section {
                            Text("Terms")
                            Text("Privacy")
                            Text("Acknowledgements")
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(AppColor.background)
//                        .textCase(.uppercase)
                        .bold()
                        .foregroundColor(AppColor.button)
                        
                    }
//                    .listRowSeparator(.hidden)
                    .listRowBackground(AppColor.secondary)
                    
                    // .listRowSeparatorTint(AppColor.red, edges: .bottom)
                    
                }
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(profile.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(AppColor.background)
        }
    }
}

#Preview {
    SettingsView()
}
