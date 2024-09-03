import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // connect() {
  //   this.element.textContent = "Hello World!"
  // }
  // add(event) {
  //   event.preventDefault();
  //   const template = document.getElementById("add-comment-form").innerHTML.content.cloneNode(true);
  //   const commentableId = event.currentTarget.dataset.commentableId;
  //   const commentableType = event.currentTarget.dataset.commentableType;
    
  //   // Replace placeholders in the template with actual values
  //   const formHtml = template
  //     .replace(/#{commentable.id}/g, commentableId)
  //     .replace(/#{commentable.class.name}/g, commentableType);
  //   this.element.innerHTML = formHtml
  // }

  add(event) {
    event.preventDefault();
    
    // Get the template element
    const templateElement = document.getElementById("add-comment-form-template");
    
    if (!templateElement) {
      console.error('Template element not found');
      return;
    }

    // Clone the template content
    const templateClone = templateElement.content.cloneNode(true);
    
    // Get the data attributes from the button
    const commentableId = event.currentTarget.dataset.commentableId;
    const commentableType = event.currentTarget.dataset.commentableType;
    
    // Find the hidden fields in the cloned template
    const commentableIdField = templateClone.querySelector('input[name="comment[commentable_id]"]');
    const commentableTypeField = templateClone.querySelector('input[name="comment[commentable_type]"]');
    
    // Set the values of the hidden fields
    if (commentableIdField) commentableIdField.value = commentableId;
    if (commentableTypeField) commentableTypeField.value = commentableType;
    
    // Replace the current content with the new template
    this.element.innerHTML = '';
    this.element.appendChild(templateClone);
  }


}
/* 
<template id="add-comment-form">
    <% @comment = Comment.new %>
    <%= form_with(model: @comment, method: :post, data: { id: "form-#{commentable.id} #{commentable.class.name}" }) do |f| %>
      <% puts 'form details arrrrr' %>
      <% p commentable %>
      <% p commentable.class.name %>
      <% p commentable.id %>
      <%= f.hidden_field :commentable_id, value: commentable.id %>
      <%= f.hidden_field :commentable_type, value: commentable.class.name %>
      <%= f.hidden_field :commentable_id, value: commentable.id, id: "commentable_id_#{commentable.id}" %>
      <%= f.hidden_field :commentable_type, value: commentable.class.name, id: "commentable_type_#{commentable.class.name}" %>
      <%= f.label :body %>
      <br>
      <%= f.text_area :body %>
      <br>
      <%= f.submit "Submit" %>
    <% end %>
  </template>
  */