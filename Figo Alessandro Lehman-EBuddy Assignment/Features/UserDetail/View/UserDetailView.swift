//
//  UserDetailView.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

import SwiftUI

struct UserDetailView: View {
  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    VStack(spacing: getScaledHeight(12)) {
      HStack(spacing: getScaledWidth(8)) {
        Text("Zynx")
          .font(.custom(type: .interBold, size: getScaledHeight(16)))
          .foregroundColor(.textPrimary)

        Circle()
          .fill(Color.textSuccess)
          .scaledFrame(width: 8, height: 8)

        Spacer()

        Image(.icVerified)
          .resizable()
          .scaledFrame(width: 20, height: 20)

        Image(.icInstagram)
          .renderingMode(.template)
          .resizable()
          .foregroundColor(.textPrimary)
          .scaledFrame(width: 20, height: 20)
      }
      .padding(.horizontal, getScaledWidth(8))

      VStack(spacing: getScaledHeight(8)) {
        Image(.imgExampleProfile)
          .resizable()
          .scaledToFit()
          .padding(.bottom, getScaledHeight(20))
          .overlay(alignment: .bottomLeading) {
            HStack(spacing: getScaledWidth(-8)) {
              Image(.imgGame1)
                .resizable()
                .scaledFrame(width: 40, height: 40)
              Image(.imgGame2)
                .resizable()
                .scaledFrame(width: 40, height: 40)
            }
            .padding(.leading, getScaledWidth(7))
          }
          .overlay(alignment: .topLeading) {
            HStack(spacing: getScaledWidth(4)) {
              Image(.icLightning)
                .resizable()
                .scaledFrame(width: 16, height: 16)

              Text("Available today!")
                .font(.custom(type: .helveticaRegular, size: getScaledHeight(12)))
                .foregroundColor(.textOnDarkBackground)
            }
            .padding(.horizontal, getScaledWidth(12))
            .padding(.vertical, getScaledHeight(6))
            .background(
              BlurViewRepresentable(style: .systemUltraThinMaterialDark)
                .cornerRadius(100)
            )
            .padding(.leading, getScaledWidth(8))
            .padding(.top, getScaledHeight(8))
          }
          .overlay(alignment: .bottomTrailing) {
            ZStack {
              Image(.icGradientCircle)
                .resizable()
                .scaledFrame(width: 40, height: 40)

              Image(.icSoundWave)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(colorScheme == .light ? .textOnDarkBackground : .iconDark)
                .scaledFrame(width: 24, height: 24)
            }
            .padding(.trailing, getScaledWidth(8))
        }

        VStack(alignment: .leading, spacing: getScaledHeight(4)) {
          HStack(spacing: getScaledWidth(4)) {
            Image(.icStar)
              .resizable()
              .scaledFrame(width: 20, height: 20)

            Text("4.9")
              .font(.custom(type: .interBold, size: getScaledHeight(14)))
              .foregroundColor(.textPrimary)

            Text("(61)")
              .font(.custom(type: .helveticaRegular, size: getScaledHeight(14)))
              .foregroundColor(.textTertiary)
          }

          HStack(spacing: getScaledWidth(4)) {
            Image(.icFire)
              .resizable()
              .scaledFrame(width: 20, height: 20)

            Group {
              Text("110")
                .font(.custom(type: .interBold, size: getScaledHeight(16)))
                .foregroundColor(.textPrimary) +
              Text(".00/1Hr")
                .font(.custom(type: .helveticaRegular, size: getScaledHeight(12)))
                .foregroundColor(.textPrimary)
            }
            .scaledFrame(height: 24, alignment: .center)
          }
          .scaledFrame(height: 24, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, getScaledWidth(4))
      }

      Spacer()
    }
    .padding(.horizontal, getScaledWidth(4))
    .background(
      Color.backgroundCard
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .ignoresSafeArea()
    )
  }
}

#Preview {
  UserDetailView()
}
