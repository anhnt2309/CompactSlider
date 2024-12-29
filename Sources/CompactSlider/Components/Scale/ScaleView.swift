// The MIT License (MIT)
//
// Copyright (c) 2022 Alexey Bukhtin (github.com/buh).
//

import SwiftUI

/// ScaleView shows the scale based on number of marks.
///
/// Scales are grouped and they need an additional help to layout.
/// Usage case:
/// ```
/// ZStack {
///     ScaleView()
///         .frame(height: 50, alignment: .top)
/// }
/// ```
public struct ScaleView: View {
    let style: ScaleStyle
    let alignment: Axis
    let steps: Int
    
    public init(
        style: ScaleStyle = ScaleStyle(),
        alignment: Axis = .horizontal,
        steps: Int = 0
    ) {
        self.style = style
        self.alignment = alignment
        self.steps = steps
    }
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            if steps == 0, let secondaryLine = style.secondaryLine {
                Scale(alignment: alignment, count: 49)
                    .stroke(secondaryLine.color, lineWidth: secondaryLine.thickness)
                    .frame(
                        width: (alignment == .vertical ? secondaryLine.length : nil),
                        height: (alignment == .horizontal ? secondaryLine.length : nil)
                    )
            }
            
            Scale(alignment: alignment, count: steps > 0 ? steps : 9)
                .stroke(style.line.color, lineWidth: style.line.thickness)
                .frame(
                    width: (alignment == .vertical ? style.line.length : nil),
                    height: (alignment == .horizontal ? style.line.length : nil)
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(style.padding)
    }
}

#Preview {
    HStack {
        VStack(spacing: 20) {
            ZStack {
                ScaleView()
                    .frame(height: 50, alignment: .top)
            }
            .background(Defaults.label.opacity(0.1))
            
            ZStack {
                ScaleView(style: .init(
                    line: .init(length: 25, thickness: 2),
                    secondaryLine: .init(length: 15, thickness: 2)
                ))
                .frame(height: 50, alignment: .top)
            }
            .background(Defaults.label.opacity(0.1))
            
            ZStack {
                ScaleView(style: .init(line: .init(length: 10), secondaryLine: nil))
                    .frame(height: 50, alignment: .top)
            }
            .background(Defaults.label.opacity(0.1))
            
            ScaleView(steps: 30)
                .frame(height: 50, alignment: .top)
                .background(Defaults.label.opacity(0.1))
            
            ScaleView(style: .init(line: .init(length: 25, thickness: 5)), steps: 10)
                .frame(height: 50, alignment: .top)
                .background(Defaults.label.opacity(0.1))
        }
    }
    .frame(width: 300)
    .padding()
}