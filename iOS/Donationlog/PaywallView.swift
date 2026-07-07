import SwiftUI

struct PaywallView: View {
    @EnvironmentObject var purchases: PurchaseManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()
                VStack(spacing: 20) {
                    Image(systemName: "star.circle.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .foregroundColor(Theme.accent)
                    Text("Donationlog Pro")
                        .font(Theme.titleFont)
                        .foregroundColor(.white)
                    Text("Annual tax-summary export and receipt photo attachments")
                        .font(Theme.bodyFont)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    if let product = purchases.product {
                        Button {
                            Task { await purchases.purchase() }
                        } label: {
                            Text("Unlock for \(product.displayPrice)")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Theme.accent)
                                .cornerRadius(Theme.cornerRadius)
                        }
                        .accessibilityIdentifier("purchaseButton")
                        .padding(.horizontal)
                    }
                    Button("Restore Purchases") {
                        Task { await purchases.restore() }
                    }
                    .foregroundColor(.white.opacity(0.7))
                    .accessibilityIdentifier("restorePaywallButton")
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                        .accessibilityIdentifier("closePaywallButton")
                }
            }
        }
    }
}
