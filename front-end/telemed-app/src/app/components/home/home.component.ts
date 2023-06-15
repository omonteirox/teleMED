import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  successMessage: string | undefined;


  constructor(private route: ActivatedRoute) {}

 ngOnInit(): void {
  this.successMessage = this.route.snapshot?.data['message'];
}
}
