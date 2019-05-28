//
//  ViewController.swift
//  EventsSelection
//
//  Created by Ihnat Moisieiev on 28/05/2019.
//  Copyright © 2019 Ihnat Moisieiev. All rights reserved.
//

import UIKit
import Highcharts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chartView = HIChartView(frame: self.view.bounds)
        
        let options = HIOptions()
        
        let chart = HIChart()
        chart.zoomType = "x"
        chart.events = HIEvents()
        chart.events.selection = HIFunction(closure: { context in
            guard let context = context else { return }
            let min = context.getProperty("event.xAxis[0].min")!, max = context.getProperty("event.xAxis[0].max")!
            print("xAxis min: \(min), xAxis max: \(max)")
        }, properties: ["event.xAxis[0].min", "event.xAxis[0].max"])
        options.chart = chart
        
        let title = HITitle()
        title.text = "Chart selection demo"
        options.title = title
        
        let subtitle = HISubtitle()
        subtitle.text = "Click and drag the plot area to draw a selection"
        options.subtitle = subtitle
        
        let column = HIColumn()
        column.data = [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        
        let series = HISeries()
        series.data = [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4].reversed()
        
        options.series = [column, series]
        
        chartView.options = options
        
        self.view.addSubview(chartView)
    }
}

