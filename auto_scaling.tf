# # auto_scaling.tf

# resource "aws_appautoscaling_target" "target" {
#   service_namespace  = "ecs"
#   resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   role_arn           = aws_iam_role.ecs_auto_scale_role.arn
#   min_capacity       = 3
#   max_capacity       = 6
# }

# # Automatically scale capacity up by one
# resource "aws_appautoscaling_policy" "up" {
#   name               = "dev_scale_up"
#   service_namespace  = "ecs"
#   resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
#   scalable_dimension = "ecs:service:DesiredCount"

#   step_scaling_policy_configuration {
#     adjustment_type         = "ChangeInCapacity"
#     cooldown                = 60
#     metric_aggregation_type = "Maximum"

#     step_adjustment {
#       metric_interval_lower_bound = 0
#       scaling_adjustment          = 1
#     }
#   }

#   depends_on = [aws_appautoscaling_target.target]
# }

# # Automatically scale capacity down by one
# resource "aws_appautoscaling_policy" "down" {
#   name               = "dev_scale_down"
#   service_namespace  = "ecs"
#   resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
#   scalable_dimension = "ecs:service:DesiredCount"

#   step_scaling_policy_configuration {
#     adjustment_type         = "ChangeInCapacity"
#     cooldown                = 60
#     metric_aggregation_type = "Maximum"

#     step_adjustment {
#       metric_interval_lower_bound = 0
#       scaling_adjustment          = -1
#     }
#   }

#   depends_on = [aws_appautoscaling_target.target]
# }