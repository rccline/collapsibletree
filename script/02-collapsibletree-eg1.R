library(collapsibleTree) 

# Create a simple org chart
org <- data.frame(
  Manager = c(
    NA, "Betty Blue", "Betty Blue", "Bill", "Bill", "Bill", "Claudette", "Claudette", "Danny",
    "Fred", "Fred", "Grace", "Larry", "Larry", "Nicholas", "Nicholas"
  ),
  Employee = c(
    "Betty Blue", "Bill", "Larry", "Claudette", "Danny", "Erika", "Fred", "Grace",
    "Henri", "Ida", "Joaquin", "Kate", "Mindy", "Nicholas", "Odette", "Peter"
  ),
  Title = c(
    "President", "VP Operations", "VP Finance", "Director", "Director", "Scientist",
    "Manager", "Manager", "Jr Scientist", "Operator", "Operator", "Associate",
    "Analyst", "Director", "Accountant", "Accountant"
  )
)
collapsibleTreeNetwork(org, attribute = "Title")
# Add in colors and sizes
org$Color <- org$Title
levels(org$Color) <- colorspace::rainbow_hcl(11)
collapsibleTreeNetwork(
  org,
  attribute = "Title",
  fill = "Color",
  nodeSize = "leafCount",
  collapsed = FALSE
)
# Use unsplash api to add in random photos to tooltip
org$tooltip <- paste0(
  org$Employee,
  "<br>Title: ",
  org$Title,
  "<br><img src='https://source.unsplash.com/collection/385548/150x100'>"
)
collapsibleTreeNetwork(
  org,
  attribute = "Title",
  fill = "Color",
  nodeSize = "leafCount",
  tooltipHtml = "tooltip",
  collapsed = FALSE
)



# geez --------------------------------------------------------------------

# Color in by number of children
collapsibleTreeSummary(warpbreaks, c("wool", "tension", "breaks"), maxPercent = 50)

# Color in by the value of breaks and use the terrain_hcl gradient
collapsibleTreeSummary(
  warpbreaks,
  c("wool", "tension", "breaks"),
  attribute = "breaks",
  fillFun = colorspace::terrain_hcl,
  maxPercent = 50
)
