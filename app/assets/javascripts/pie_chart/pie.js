function InitChart(element, options) {
    var self = this;
    self.$element = $(element);
    self.width = self.$element.width() * 2 / 3;
    // self.height = self.$element.height() * 2 / 3;
    self.height = self.width;
    self.$element.css('height', self.height);
    self.summ = 0;
    self.centerText = 'Text';
    self.data = [{label: 'label', value: 100, color: '#FFBA40'}];
    self.margin = 40;
    self.radius = self.width / 2;
    self.duration = 2000;
    self.units = '';
    // self.isBusy = false;
    self.effect = true;

    if (typeof options == 'object') {
        if (Array.isArray(options.data)){
            self.data = options.data
        }else{
            self.data = options.data[options.locale];
        }
        self.centerText = options.centerText || self.centerText;
        self.duration = options.duration || self.duration;
        self.units = options.units || self.units;
        if(options.effect == false){
            self.effect = options.effect;
        }
    }

    for (var i = 0; i < self.data.length; i++) {
        self.summ = self.summ + self.data[i].value;
    }

    self.data.forEach(function (d) {
        d.percent = (d.value*100 / self.summ).toFixed(1);
        d.units = self.units
    });

    // donut chart arc
    var arc1 = d3.arc().outerRadius(self.radius - self.margin).innerRadius(self.radius - self.margin - 10); //outer circle
    var arc2 = d3.arc().outerRadius(self.radius - self.margin - 20).innerRadius(self.radius - self.margin - self.radius / 3);  //inside circle
    // arc for the labels position
    var labelArc = d3.arc().outerRadius(self.radius).innerRadius(self.radius - self.margin); //label
    // generate pie chart and donut chart
    var pie = d3.pie().sort(null).value(function (d) { return d.value });

    remove();
    build(arc1, arc2, labelArc);

    function remove() {
        $(element).empty();
    }

    function build(arc1, arc2, labelArc) {
        // Define the div for the tooltip
        var div = d3.select(element).append("div")
            .attr("class", "tooltip")
            .style("opacity", 0);

        var svg = d3.select(element).append("svg")
            .attr("width", self.width)
            .attr("height", self.height)
            .append("g")
            .attr("transform", "translate(" + self.radius + "," + self.radius + ")");

        // "g element is a container used to group other SVG elements"
        var g1 = svg.selectAll(".arc1")
            .data(pie(self.data))
            .enter()
            .append("g")
            .attr("class", "arc1")
            .on("mouseover", function(d) {
                div.transition().duration(200).style("opacity", .9);
                div.html('<p>' + d.data.label + '</p>')
                    .style("left", (d3.event.layerX) + "px")
                    .style("top", (d3.event.layerY) + "px");
            })
            .on("mouseout", function(d) {
                div.transition().duration(500).style("opacity", 0);
            });

        var g2 = svg.selectAll(".arc2")
            .data(pie(self.data))
            .enter()
            .append("g")
            .attr("class", "arc2")
            .on("mouseover", function(d) {
                div.transition().duration(200).style("opacity", .9);
                div.html('<p>' + d.data.label + '</p><p>'+ d.data.value + d.data.units +'</p>')
                    .style("left", (d3.event.layerX) + "px")
                    .style("top", (d3.event.layerY) + "px");
            })
            .on("mouseout", function(d) {
                div.transition().duration(500).style("opacity", 0);
            });

        // append text
        svg.append("text")
            .attr('class','center-text')
            .attr("text-anchor", "middle")
            .style("font-size","20px")
            .style("text-decoration","bold")
            .text(self.centerText);

        if (!self.effect){
            g1.append("path")
                .attr("d", arc1)
                .style("fill", function (d) {
                    return d.data.color;
                })
                .transition();

            g2.append("path")
                .attr("d", arc2)
                .style("fill", function (d) {
                    return d.data.color;
                })
                .transition();

            // append label
            g1.append("text")
                .attr("transform", function (d) {
                    return "translate(" + labelArc.centroid(d) + ")";
                })
                .attr("dy", ".35em")
                .text(function (d) { return d.data.percent + ' %' });
        }else{
            g1.append("path")
                .attr("d", arc1)
                .style("fill", function (d) {
                    return d.data.color;
                })
                .transition()
                .ease(d3.easeLinear)
                .duration(self.duration)
                .attrTween("d", tweenDonut1);


            g2.append("path")
                .attr("d", arc2)
                .style("fill", function (d) {
                    return d.data.color;
                })
                .transition()
                .ease(d3.easeLinear)
                .duration(self.duration)
                .attrTween("d", tweenDonut2);

            // append label
            g1.append("text")
                .transition()
                .ease(d3.easeLinear)
                .duration(self.duration)
                .attr("transform", function (d) {
                    return "translate(" + labelArc.centroid(d) + ")";
                })
                .attr("dy", ".35em")
                .text(function (d) { return d.data.percent + ' %' });
        }

        //wait for rendering pie
        // if (!self.isBusy){
        //     setTimeout(function () {
        //         self.isBusy = true;
        //     }, self.duration)
        // }
    }

    // Helper function for animation of outer pie chart
    function tweenDonut1(b) {
        b.innerRadius = 0;
        var i = d3.interpolate({startAngle: 0, endAngle: 0}, b);
        return function (t) { return arc1(i(t)) };
    }

    // Helper function for animation of inside pie chart
    function tweenDonut2(b) {
        b.innerRadius = 0;
        var i = d3.interpolate({startAngle: 0, endAngle: 0}, b);
        return function (t) { return arc2(i(t)) };
    }
}
