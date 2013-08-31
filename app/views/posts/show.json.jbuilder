json.description @post.description
json.monthly @post.monthly
json.security @post.security
json.last @post.last
json.timeslots @post.calculateTimeslots, :start, :end, :free
